# Create kind cluster
resource "kind_cluster" "main" {
  name       = var.cluster.name
  node_image = var.cluster.image

  kind_config {
    kind        = "Cluster"
    api_version = var.kind_config.api_version

    node {
      role = var.kind_config.node_role

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
    labels = merge(
      var.tags,
      {
        "name" = var.namespace
      }
    )
  }

  depends_on = [kind_cluster.main]
}
