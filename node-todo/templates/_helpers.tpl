{{/*
Expand the name of the chart.
*/}}
{{- define "node-todo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "node-todo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create unified labels for node-todo components
*/}}
{{- define "node-todo.common.matchLabels" -}}
app: {{ template "node-todo.name" . }}
release: {{ .Release.Name }}
{{- end -}}

{{- define "node-todo.common.metaLabels" -}}
chart: {{ template "node-todo.chart" . }}
heritage: {{ .Release.Service }}
{{- end -}}

{{- define "node-todo.authapi.labels" -}}
{{ include "node-todo.authapi.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.authapi.matchLabels" -}}
component: {{ .Values.authapi.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{- define "node-todo.frontend.labels" -}}
{{ include "node-todo.frontend.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.frontend.matchLabels" -}}
component: {{ .Values.frontend.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{- define "node-todo.logmessage.labels" -}}
{{ include "node-todo.logmessage.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.logmessage.matchLabels" -}}
component: {{ .Values.logmessage.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{- define "node-todo.redisqueue.labels" -}}
{{ include "node-todo.redisqueue.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.redisqueue.matchLabels" -}}
component: {{ .Values.redisqueue.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{- define "node-todo.todosapi.labels" -}}
{{ include "node-todo.todosapi.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.todosapi.matchLabels" -}}
component: {{ .Values.todosapi.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{- define "node-todo.usersapi.labels" -}}
{{ include "node-todo.usersapi.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.usersapi.matchLabels" -}}
component: {{ .Values.usersapi.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{- define "node-todo.zipkin.labels" -}}
{{ include "node-todo.zipkin.matchLabels" . }}
{{ include "node-todo.common.metaLabels" . }}
{{- end -}}

{{- define "node-todo.zipkin.matchLabels" -}}
component: {{ .Values.zipkin.name | quote }}
{{ include "node-todo.common.matchLabels" . }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "node-todo.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a fully qualified authapi name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.authapi.fullname" -}}
{{- if .Values.authapi.fullnameOverride -}}
{{- .Values.authapi.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.authapi.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.authapi.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Create a fully qualified frontend name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.frontend.fullname" -}}
{{- if .Values.frontend.fullnameOverride -}}
{{- .Values.frontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified logmessage name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.logmessage.fullname" -}}
{{- if .Values.logmessage.fullnameOverride -}}
{{- .Values.logmessage.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.logmessage.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.logmessage.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified redisqueue name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.redisqueue.fullname" -}}
{{- if .Values.redisqueue.fullnameOverride -}}
{{- .Values.redisqueue.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.redisqueue.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.redisqueue.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified todosapi name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.todosapi.fullname" -}}
{{- if .Values.todosapi.fullnameOverride -}}
{{- .Values.todosapi.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.todosapi.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.todosapi.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified usersapi name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.usersapi.fullname" -}}
{{- if .Values.usersapi.fullnameOverride -}}
{{- .Values.usersapi.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.usersapi.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.usersapi.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified zipkin name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "node-todo.zipkin.fullname" -}}
{{- if .Values.zipkin.fullnameOverride -}}
{{- .Values.zipkin.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.zipkin.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.zipkin.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "node-todo.labels" -}}
helm.sh/chart: {{ include "node-todo.chart" . }}
{{ include "node-todo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "node-todo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "node-todo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "node-todo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "node-todo.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
