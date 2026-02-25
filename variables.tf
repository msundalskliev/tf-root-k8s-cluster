variable "namespace" {
  type        = string
  description = "Kubernetes namespace"
}

variable "cluster" {
  type = object({
    name  = string
    ports = map(number)
  })
  description = "Cluster configuration"
}

variable "helm_chart" {
  type = object({
    enabled = bool
    name    = string
    path    = string
    values  = any
  })
  description = "Helm chart configuration"
  default = {
    enabled = false
    name    = ""
    path    = ""
    values  = {}
  }
}