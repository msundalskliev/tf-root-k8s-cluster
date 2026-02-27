terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.2"
    }
  }
}

provider "kind" {}

provider "kubernetes" {
  host                   = kind_cluster.main.endpoint
  cluster_ca_certificate = kind_cluster.main.cluster_ca_certificate
  client_certificate     = kind_cluster.main.client_certificate
  client_key             = kind_cluster.main.client_key
}