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

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default     = {}
}

variable "kind_config" {
  type = object({
    api_version = string
    node_role   = string
  })
  description = "Kind cluster configuration"
  default = {
    api_version = "kind.x-k8s.io/v1alpha4"
    node_role   = "control-plane"
  }
}
