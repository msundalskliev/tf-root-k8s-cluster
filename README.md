# Generic Kubernetes Cluster Module

Terraform module for provisioning Kind clusters with optional Helm chart deployment.

## What it creates

- Kind cluster with configurable ports
- Kubernetes namespace
- Optional Helm chart deployment

## Usage

### With terraformlib

```bash
# Plan
terraformlib plan -c config.yaml -m manifest.yaml -s tf-root-k8s-cluster

# Apply (uses existing generated files)
terraformlib apply -s tf-root-k8s-cluster

# Destroy
terraformlib destroy -s tf-root-k8s-cluster
```

### Direct Terraform

```bash
terraform init
terraform plan -var-file=.terraform/terraform.json
terraform apply -var-file=.terraform/terraform.json
```

## Development

```bash
# Install pre-commit
pip install pre-commit
pre-commit install

# Run checks
pre-commit run --all-files
```

## Variables

- `namespace` - Kubernetes namespace name
- `cluster.name` - Kind cluster name
- `cluster.ports` - Map of ports to expose (e.g. {grafana: 30080})
- `helm_chart.enabled` - Deploy Helm chart (true/false)
- `helm_chart.name` - Chart name
- `helm_chart.path` - Path to chart
- `helm_chart.values` - Chart values

## Files

- `main.tf` - Resources
- `variables.tf` - Variable definitions
- `providers.tf` - Provider configuration
- `backend.tf` - State backend
- `.gitignore` - Excludes generated files