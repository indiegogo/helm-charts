# Lita Chart packaged by Indiegogo

## TL;DR

```bash
$ helm repo add indiegogo https://charts.indiegogo.com
$ helm install my-release indiegogo/lita
```

## Introduction

This chart bootstraps a Lita deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.6.2

## Getting started with default values

To get you started with modifying the default values to your liking/needs, use the below command to grab the latest `values.yaml` file:

```bash
$ helm show values indiegogo/lita > values.yaml
```

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release indiegogo/lita
```

The command deploys Lita on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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
| `networkPort`      | int    | Deployment container, Deployment livenessProbe, and Service port | `8080`  |


### Lita configuration parameters

| Name                             | Type   | Description                                                | Default             |
| -------------------------------- | ------ | ---------------------------------------------------------- | --------------------|
| `configuration.circleCiHost`     | string | CircleCI host that Lita communicates with                  | `"circleci.igg.me"` |
| `configuration.enableDebug`      | string | Enable debugging in Lita                                   | `""`                |
| `configuration.circleCiApiToken` | string | CircleCI API token so Lita can communication with CircleCI | `"CHANGEME"`        |
| `configuration.slackToken`       | string | Slack token so Lita can communicate with Slack             | `"CHANGEME"`        |


### Deployment parameters

| Name                                | Type    | Description                                                    | Default                    |
| ----------------------------------- | ------- | -------------------------------------------------------------- | -------------------------- |
| `image.registry`                    | string  | The Docker image registry                                      | `"gcr.io"`                 |
| `image.repository`                  | string  | The Docker image repository                                    | `"indiegogo-staging/lita"` |
| `image.tag`                         | string  | The Docker image tag                                           | `'latest'`                 |
| `image.pullPolicy`                  | string  | The Docker image pull policy                                   | `"IfNotPresent"`           |
| `environmentIncludeDefault`         | boolean | Include/don't include the default environment variables        | `true`                     |
| `environment`                       | object  | Custom/extra environment variables                             | `{}`                       |
| `containerPort`                     | int     | Lita container port (overrides `networkPort`)                  | `nil`                      |
| `replicaCount`                      | int     | Number of Lita replicas to deploy                              | `1`                        |
| `strategy.type`                     | string  | Deployment strategy type                                       | `"RollingUpdate"`          |
| `strategy.rollingUpdate`            | object  | Rolling update deployment strategy options                     | `{}`                       |
| `resources.requests`                | object  | CPU/memory resource requests                                   | `{}`                       |
| `resources.limits`                  | object  | CPU/memory resource limits                                     | `{}`                       |
| `livenessProbe.enabled`             | boolean | Enable/Disable the default tcpSocket livenessProbe             | `true`                     |
| `livenessProbe.port`                | int     | Default livenessProbe tcpSocket port (overrides `networkPort`) | `nil`                      |
| `livenessProbe.initialDelaySeconds` | int     | Initial delay seconds for livenessProbe                        | `nil`                      |
| `livenessProbe.periodSeconds`       | int     | Period seconds for livenessProbe                               | `nil`                      |
| `livenessProbe.timeoutSeconds`      | int     | Timeout seconds for livenessProbe                              | `nil`                      |
| `livenessProbe.successThreshold`    | int     | Success threshold for livenessProbe                            | `nil`                      |
| `livenessProbe.failureThreshold`    | int     | Failure threshold for livenessProbe                            | `nil`                      |
| `customLivenessProbe`               | object  | Custom livenessProbe that overrides the default one            | `{}`                       |
| `readinessProbeEnabled`             | boolean | Enable the custom readinessProbe                               | `false`                    |
| `readinessProbe`                    | object  | Write your custom readiness probe here                         | `{}`                       |
| `usePacificTime`                    | boolean | Use Pacific time instead of UTC in container                   | `false`                    |


### Service parameters

| Name           | Type   | Description                                 | Default      |
| ---------------| ------ | ------------------------------------------- | ------------ |
| `service.port` | int    | Lita Service port (overrides `networkPort`) | `nil`        |
| `service.type` | string | Lita Service Type                           | `"NodePort"` |


### Ingress parameters

| Name                        | Type    | Description                | Default           |
| --------------------------- | ------- | -------------------------- | ----------------- |
| `ingress.enabled`           | boolean | Enable/Disable Ingress     | `true`            |
| `ingress.tls.enabled`       | boolean | Enable/Disable Ingress TLS | `false`           |
| `ingress.tls.hosts`         | list    | Ingress TLS host(s)        | see `values.yaml` |
| `ingress.tls.secretName`    | string  | Ingress TLS Secret name    | `nil`             |
| `ingress.rules.hosts`       | list    | Ingress rules host(s)      | see `values.yaml` |
| `ingress.customAnnotations` | object  | Ingress custom annotations | `{}`              |


### Redis storage parameters

| Name                             | Type    | Description                                     | Default    |
| -------------------------------- | ------- | ----------------------------------------------- | ---------- |
| `persistentVolume.enabled`       | boolean | Enable to use an existing Redis persistent disk | `false`    |
| `persistentVolume.pdName`        | string  | Name of the existing persistent disk            | `nil`      |
| `persistentVolume.reclaimPolicy` | string  | Reclamation of the persistent disk resources    | `"Retain"` |


### Redis chart parameters

| Name                                      | Type    | Description                                    | Default      |
| ----------------------------------------- | ------- | ---------------------------------------------- | ------------ |
| `redis.chartEnabled`                      | boolean | Enable the Redis chart dependency              | `true`       |
| `redis.fullnameOverride`                  | string  | Fully override the default Redis instance name | `"redis"`    |
| `redis.args`                              | list    | Add extra Redis command arguments              | `[]`         |
| `redis.storage.persistentVolumeClaimName` | string  | Set to use an existing Persistent Volume Claim | `nil`        |
| `redis.storage.requestedSize`             | string  | Set to create a new Persistent Volume Claim    | `"10Gi"`     |
| `redis.storage.className`                 | string  | Type of storage (standard/ssd)                 | `"standard"` |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
  --set replicaCount=1 \
    indiegogo/lita
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml indiegogo/lita
```

> **Tip**: You can use the default [values.yaml](values.yaml)
