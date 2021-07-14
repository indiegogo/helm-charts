{{/* vim: set filetype=mustache: */}}

{{/*
Get the ots secret name.
*/}}
{{- define "ots.secretName" -}}
{{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}

{{/*
Get the ots secret key.
*/}}
{{- define "ots.secretKey" -}}
{{- printf "%s_secret" (include "common.names.fullname" .) | upper -}}
{{- end -}}

{{/*
Return the ots secret.
*/}}
{{- define "ots.secret" -}}
{{- if not (empty .Values.configuration.secret) }}
    {{- .Values.configuration.secret -}}
{{- end -}}
{{- end -}}
