output "cluster_name" {
  description = "Name of the Kind cluster"
  value       = kind_cluster.main.name
}

output "namespace_name" {
  description = "Name of the Kubernetes namespace"
  value       = kubernetes_namespace_v1.main.metadata[0].name
}

output "cluster_endpoint" {
  description = "Kubernetes cluster endpoint"
  value       = kind_cluster.main.endpoint
  sensitive   = true
}

output "cluster_ports" {
  description = "Exposed cluster ports"
  value       = var.cluster.ports
}
