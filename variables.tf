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