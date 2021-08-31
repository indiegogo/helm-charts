# Storybook Chart packaged by Indiegogo

## TL;DR

```bash
$ helm repo add indiegogo https://charts.indiegogo.com
$ helm install my-release indiegogo/storybook
```

## Introduction

This chart bootstraps a Storybook deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.6.2

## Getting started with default values

To get you started with modifying the default values to your liking/needs, use the below command to grab the latest `values.yaml` file:

```bash
$ helm show values indiegogo/storybook > values.yaml
```

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release indiegogo/storybook
```

The command deploys Storybook on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name               | Type   | Description                                                      | Default |
| ------------------ | ------ | ---------------------------------------------------------------- | ------- |
| `kubeVersion`      | string | Override Kubernetes version                                      | `nil`   |
| `nameOverride`     | string | Partially override names.fullname                                | `nil`   |
| `fullnameOverride` | string | Fully override names.fullname                                    | `nil`   |
| `commonLabels`     | object | Labels to add to all deployed objects                            | `{}`    |
| `networkPort`      | int    | Deployment container, Deployment livenessProbe, and Service port | `80`    |


### Deployment parameters

| Name                     | Type    | Description                                        | Default                         |
| ------------------------ | ------- | -------------------------------------------------- | ------------------------------- |
| `image.registry`         | string  | The Docker image registry                          | `"gcr.io"`                      |
| `image.repository`       | string  | The Docker image repository                        | `"indiegogo-staging/storybook"` |
| `image.tag`              | string  | The Docker image tag                               | `'latest'`                      |
| `image.pullPolicy`       | string  | The Docker image pull policy                       | `"IfNotPresent"`                |
| `environment`            | object  | Custom/extra environment variables                 | `{}`                            |
| `containerPort`          | int     | Storybook container port (overrides `networkPort`) | `nil`                           |
| `replicaCount`           | int     | Number of Storybook replicas to deploy             | `1`                             |
| `strategy.type`          | string  | Deployment strategy type                           | `"RollingUpdate"`               |
| `strategy.rollingUpdate` | object  | Rolling update deployment strategy options         | `{}`                            |
| `resources.requests`     | object  | CPU/memory resource requests                       | `{}`                            |
| `resources.limits`       | object  | CPU/memory resource limits                         | `{}`                            |
| `livenessProbeEnabled`   | boolean | Enable the custom livenessProbe                    | `true`                          |
| `livenessProbe`          | object  | Write your custom liveness probe here              | `{}`                            |
| `readinessProbeEnabled`  | boolean | Enable the custom readinessProbe                   | `false`                         |
| `readinessProbe`         | object  | Write your custom readiness probe here             | `{}`                            |
| `usePacificTime`         | boolean | Use Pacific time instead of UTC in container       | `false`                         |


### Service parameters

| Name           | Type   | Description                                      | Default      |
| ---------------| ------ | ------------------------------------------------ | ------------ |
| `service.port` | int    | Storybook Service port (overrides `networkPort`) | `nil`        |
| `service.type` | string | Storybook Service Type                           | `"NodePort"` |


### Ingress parameters

| Name                        | Type    | Description                | Default           |
| --------------------------- | ------- | -------------------------- | ----------------- |
| `ingress.enabled`           | boolean | Enable/Disable Ingress     | `true`            |
| `ingress.tls.enabled`       | boolean | Enable/Disable Ingress TLS | `false`           |
| `ingress.tls.hosts`         | list    | Ingress TLS host(s)        | see `values.yaml` |
| `ingress.tls.secretName`    | string  | Ingress TLS Secret name    | `nil`             |
| `ingress.rules.hosts`       | list    | Ingress rules host(s)      | see `values.yaml` |
| `ingress.customAnnotations` | object  | Ingress custom annotations | `{}`              |


### Storage parameters

| Name                                     | Type    | Description                                       | Default      |
| ---------------------------------------- | ------- | ------------------------------------------------- | ------------ |
| `storage.requestedSize`                  | string  | Size of Persistent Volume Claim/Persistent Volume | `"10Gi"`     |
| `storage.className`                      | string  | Type of storage (standard/ssd)                    | `"standard"` |
| `storage.persistentVolume.enabled`       | boolean | Enable to use an existing persistent disk         | `false`      |
| `storage.persistentVolume.pdName`        | string  | Name of the existing persistent disk              | `nil`        |
| `storage.persistentVolume.reclaimPolicy` | string  | Reclamation of the persistent disk resources      | `"Retain"`   |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
  --set replicaCount=1 \
    indiegogo/storybook
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml indiegogo/storybook
```

> **Tip**: You can use the default [values.yaml](values.yaml)
