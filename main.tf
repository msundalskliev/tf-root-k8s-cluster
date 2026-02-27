# Create kind cluster
resource "kind_cluster" "main" {
  name = var.cluster.name

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

      dynamic "extra_port_mappings" {
        for_each = var.cluster.ports
        content {
          container_port = extra_port_mappings.value
          host_port      = extra_port_mappings.value
        }
      }
    }
  }
}

resource "kubernetes_namespace" "main" {
  metadata {
    name = var.namespace
  }

  depends_on = [kind_cluster.main]
}

