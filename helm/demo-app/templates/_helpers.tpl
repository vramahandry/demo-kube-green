{{- define "demo-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "demo-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "demo-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "demo-app.labels" -}}
app.kubernetes.io/name: {{ include "demo-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
