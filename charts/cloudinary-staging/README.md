# Cloudinary-staging Chart packaged by Indiegogo

The Cloudinary-staging application is responsible for proxying the Cloudinary images in our Staging environment.

## TL;DR

```bash
$ helm repo add indiegogo https://charts.indiegogo.com
$ helm install my-release indiegogo/cloudinary-staging
```

## Introduction

This chart bootstraps a Cloudinary-staging deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.6.2

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release indiegogo/cloudinary-staging
```

The command deploys Cloudinary-staging on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm uninstall my-release
```

> NOTE: If you used `-n namespace` when you installed the chart, be sure to use it again when you uninstall the chart, otherwise the associated dependency Kubernetes resources will not be deleted:

```bash
$ helm uninstall -n namespace my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters


### Common parameters

| Name                | Type   | Description                                                                | Default |
| ------------------- | ------ | -------------------------------------------------------------------------- | ------- |
| `kubeVersion`       | string | Override Kubernetes version                                                | `nil`   |
| `nameOverride`      | string | Partially override names.fullname                                          | `nil`   |
| `fullnameOverride`  | string | Fully override names.fullname                                              | `nil`   |
| `commonLabels`      | object | Labels to add to all deployed objects                                      | `{}`    |
| `commonAnnotations` | object | Annotations to add to all deployed objects                                 | `{}`    |
| `networkPort`       | int    | Deployment container, Deployment readinessProbe, Ingress, and Service port | `80`    |


### Deployment parameters

| Name                                 | Type    | Description                                                   | Default                     |
| ------------------------------------ | ------- | ------------------------------------------------------------- | --------------------------- |
| `image.registry`                     | string  | The Docker image registry                                     | `"gcr.io"`                  |
| `image.repository`                   | string  | The Docker image repository                                   | `"indiegogo-staging/nginx"` |
| `image.tag`                          | string  | The Docker image tag                                          | `'latest'`                  |
| `image.pullPolicy`                   | string  | The Docker image pull policy                                  | `"IfNotPresent"`            |
| `containerPort`                      | int     | Cloudinary container port (overrides `networkPort`)           | `nil`                       |
| `replicaCount`                       | int     | Number of Cloudinary replicas to deploy                       | `3`                         |
| `strategy.type`                      | string  | Deployment strategy type                                      | `"RollingUpdate"`           |
| `resources.requests`                 | object  | CPU/memory resource requests                                  | `{}`                        |
| `resources.limits`                   | object  | CPU/memory resource limits                                    | `{}`                        |
| `readinessProbe.enabled`             | boolean | Enable/Disable the default httpGet readinessProbe             | `true`                      |
| `readinessProbe.port`                | int     | Default readinessProbe httpGet port (overrides `networkPort`) | `nil`                       |
| `readinessProbe.initialDelaySeconds` | int     | Initial delay seconds for readinessProbe                      | `5`                         |
| `readinessProbe.periodSeconds`       | int     | Period seconds for readinessProbe                             | `5`                         |
| `readinessProbe.timeoutSeconds`      | int     | Timeout seconds for readinessProbe                            | `nil`                       |
| `readinessProbe.successThreshold`    | int     | Success threshold for readinessProbe                          | `nil`                       |
| `readinessProbe.failureThreshold`    | int     | Failure threshold for readinessProbe                          | `nil`                       |
| `customReadinessProbe`               | object  | Custom readinessProbe that overrides the default one          | `{}`                        |
| `livenessProbeEnabled`               | boolean | Enable the custom livenessProbe                               | `false`                     |
| `livenessProbe`                      | object  | Write your custom liveness probe here                         | `{}`                        |


### Service parameters

| Name           | Type    | Description                                         | Default      |
| ---------------| ------- | --------------------------------------------------- | ------------ |
| `service.name` | string  | Cloudinary Service port (overrides `.Release.Name`) | `"http"`     |
| `service.port` | int     | Cloudinary Service port (overrides `networkPort`)   | `80`         |
| `service.type` | string  | Cloudinary Service Type                             | `"NodePort"` |


### Ingress parameters

| Name                          | Type    | Description                                          | Default |
| ----------------------------- | ------- | ---------------------------------------------------- | ------- |
| `ingress.enabled`             | boolean | Enable/Disable Ingress                               | `true`  |
| `ingress.backend.serviceName` | string  | Ingress rules service name                           | `nil`   |
| `ingress.backend.servicePort` | int     | Ingress rules service port (overrides `networkPort`) | `nil`   |
| `ingress.customAnnotations`   | object  | Ingress custom annotations                           | `{}`    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
  --set replicaCount=1 \
    indiegogo/cloudinary-staging
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml indiegogo/cloudinary-staging
```

> **Tip**: You can use the default [values.yaml](values.yaml)
