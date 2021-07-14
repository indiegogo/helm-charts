{{/* vim: set filetype=mustache: */}}

{{/*
Renders a value that contains template.
Usage:
{{ include "common.tplValues.render" ( dict "value" .Values.path.to.the.Value "scope" $) }}
*/}}
{{- define "common.tplValues.render" -}}
  {{- if typeIs "string" .value }}
    {{- tpl .value .scope }}
  {{- else }}
    {{- tpl (.value | toYaml) .scope }}
  {{- end }}
{{- end }}
