# One-Time Secret Chart packaged by Indiegogo

[One-Time Secret](https://onetimesecret.com) ([GitHub](https://github.com/onetimesecret/onetimesecret)) is a way to share sensitive information by keeping it out of email and chat logs.

## TL;DR

```bash
$ helm repo add indiegogo https://charts.indiegogo.com
$ helm install my-release indiegogo/onetimesecret
```

## Introduction

This chart bootstraps a One-Time Secret deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.6.2

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install my-release indiegogo/onetimesecret
```

The command deploys One-Time Secret on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

| Name               | Type   | Description                                                               | Default |
| ------------------ | ------ | ------------------------------------------------------------------------- | ------- |
| `kubeVersion`      | string | Override Kubernetes version                                               | `nil`   |
| `nameOverride`     | string | Partially override names.fullname                                         | `nil`   |
| `fullnameOverride` | string | Fully override names.fullname                                             | `nil`   |
| `commonLabels`     | object | Labels to add to all deployed objects                                     | `{}`    |
| `networkPort`      | int    | Deployment container, Deployment livenessProbe, Ingress, and Service port | `3000`  |


### One-Time Secret configuration parameters

| Name                                     | Type    | Description                                                                         | Default                  |
| ---------------------------------------- | ------- | ----------------------------------------------------------------------------------- | ------------------------ |
| `configuration.host`                     | string  | OTS host (the domain you will access OTS at)                                        | `"localhost"`            |
| `configuration.hostPort`                 | int     | OTS host port (the HTTP port used to access OTS)                                    | `nil`                    |
| `configuration.ssl`                      | boolean | Enable SSL (HTTPS) support                                                          | `false`                  |
| `configuration.baseRedisUrl`             | string  | Base Redis URL (see values.yaml for more info)                                      | `""`                     |
| `configuration.colonels`                 | string  | OTS account created with this email is automatically considered admin of the system | `""`                     |
| `configuration.secret`                   | string  | Used to encrypt OTS secrets - don't forget this, save it somewhere safe             | `"CHANGEME"`             |
| `configuration.emailer.sendgridEnabled`  | boolean | Use SendGrid to allow OTS the ability to send emails                                | `false`                  |
| `configuration.emailer.smtpEnabled`      | boolean | Use SMTP to allow OTS the ability to send emails                                    | `false`                  |
| `configuration.emailer.from`             | string  | SendGrid/SMTP email sender "from" email address                                     | `""`                     |
| `configuration.emailer.sendgridAccount`  | string  | SendGrid account login                                                              | `"CHANGEME"`             |
| `configuration.emailer.sendgridPassword` | string  | SendGrid account password                                                           | `"CHANGEME"`             |
| `configuration.emailer.sendgridFromName` | string  | SendGrid email sender "From" name                                                   | `"CHANGEME"`             |
| `configuration.emailer.sendgridBcc`      | string  | SendGrid email BCC field                                                            | `nil`                    |
| `configuration.emailer.smtpHost`         | string  | SMTP hostname                                                                       | `"localhost"`            |
| `configuration.emailer.smtpPort`         | int     | SMTP port                                                                           | `587`                    |
| `configuration.emailer.smtpTls`          | boolean | Enable/Disable TLS for SMTP                                                         | `false`                  |
| `configuration.emailer.smtpUser`         | string  | SMTP username                                                                       | `nil`                    |
| `configuration.emailer.smtpPass`         | string  | SMTP password                                                                       | `nil`                    |
| `configuration.emailer.smtpAuth`         | string  | SMTP authentication type. Allowed values: `plain` or `login`                        | `nil`                    |
| `configuration.incoming.enabled`         | boolean | Intended for use by IT support teams who need someone to send them sensitive info   | `false`                  |
| `configuration.incoming.email`           | string  | Where the secret link is sent                                                       | `"CHANGEME@example.com"` |
| `configuration.incoming.passphrase`      | string  | Used to protect the "secret"                                                        | `"CHANGEME"`             |
| `configuration.incoming.regex`           | string  | Used to ensure the ticket number is valid                                           | `'\A[a-zA-Z0-9]{6}\z'`   |


### Deployment parameters

| Name                                | Type    | Description                                                    | Default                            |
| ----------------------------------- | ------- | -------------------------------------------------------------- | ---------------------------------- |
| `image.registry`                    | string  | The Docker image registry                                      | `"gcr.io"`                         |
| `image.repository`                  | string  | The Docker image repository                                    | `"indiegogo-public/onetimesecret"` |
| `image.tag`                         | string  | The Docker image tag                                           | `'latest'`                         |
| `image.pullPolicy`                  | string  | The Docker image pull policy                                   | `"IfNotPresent"`                   |
| `containerPort`                     | int     | OTS container port (overrides `networkPort`)                   | `nil`                              |
| `replicaCount`                      | int     | Number of OTS replicas to deploy                               | `1`                                |
| `strategy.type`                     | string  | Deployment strategy type                                       | `"RollingUpdate"`                  |
| `resources.requests`                | object  | CPU/memory resource requests                                   | `{}`                               |
| `resources.limits`                  | object  | CPU/memory resource limits                                     | `{}`                               |
| `livenessProbe.enabled`             | boolean | Enable/Disable the default tcpSocket livenessProbe             | `true`                             |
| `livenessProbe.port`                | int     | Default livenessProbe tcpSocket port (overrides `networkPort`) | `nil`                              |
| `livenessProbe.initialDelaySeconds` | int     | Initial delay seconds for livenessProbe                        | `30`                               |
| `livenessProbe.periodSeconds`       | int     | Period seconds for livenessProbe                               | `nil`                              |
| `livenessProbe.timeoutSeconds`      | int     | Timeout seconds for livenessProbe                              | `nil`                              |
| `livenessProbe.successThreshold`    | int     | Success threshold for livenessProbe                            | `nil`                              |
| `livenessProbe.failureThreshold`    | int     | Failure threshold for livenessProbe                            | `nil`                              |
| `customLivenessProbe`               | object  | Custom livenessProbe that overrides the default one            | `{}`                               |
| `readinessProbeEnabled`             | boolean | Enable the custom readinessProbe                               | `false`                            |
| `readinessProbe`                    | object  | Write your custom readiness probe here                         | `{}`                               |


### Service parameters

| Name           | Type   | Description                                | Default      |
| ---------------| ------ | ------------------------------------------ | ------------ |
| `service.port` | int    | OTS Service port (overrides `networkPort`) | `nil`        |
| `service.type` | string | OTS Service Type                           | `"NodePort"` |


### Ingress parameters

| Name                        | Type    | Description                                          | Default |
| --------------------------- | ------- | ---------------------------------------------------- | ------- |
| `ingress.enabled`           | boolean | Enable/Disable Ingress                               | `true`  |
| `ingress.tls.enabled`       | boolean | Enable/Disable Ingress TLS                           | `false` |
| `ingress.tls.hosts`         | string  | Ingress TLS host(s)                                  | `""`    |
| `ingress.tls.secretName`    | string  | Ingress TLS Secret name                              | `nil`   |
| `ingress.rules.host`        | string  | Ingress rules host                                   | `nil`   |
| `ingress.rules.path`        | string  | Ingress rules path                                   | `nil`   |
| `ingress.rules.pathType`    | string  | Ingress rules path type                              | `nil`   |
| `ingress.rules.serviceName` | string  | Ingress rules service name                           | `nil`   |
| `ingress.rules.servicePort` | int     | Ingress rules service port (overrides `networkPort`) | `nil`   |
| `ingress.customRules`       | list    | Ingress custom rules                                 | `[]`    |
| `ingress.customAnnotations` | object  | Ingress custom annotations                           | `{}`    |


### Redis chart parameters

| Name                     | Type    | Description                                    | Default   |
| ------------------------ | ------- | ---------------------------------------------- | --------- |
| `redis.chartEnabled`     | boolean | Enable the Redis chart dependency              | `true`    |
| `redis.fullnameOverride` | string  | Fully override the default Redis instance name | `"redis"` |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install my-release \
  --set configuration.secret=secretpassword \
    indiegogo/onetimesecret
```

The above command sets the Kubernetes secret that OTS will use during the encryption of the secrets secured by One-Time Secret.

> NOTE: Once this chart is deployed, this is a value that you will not want to change as it will render your secrets inaccessible.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install my-release -f values.yaml indiegogo/onetimesecret
```

> **Tip**: You can use the default [values.yaml](values.yaml)
