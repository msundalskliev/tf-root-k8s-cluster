# tf-root-k8s-cluster

Spins up a Kind cluster with whatever you need.

## What you get

- Kind cluster with ports you specify
- Kubernetes namespace

## Usage

```bash
# Plan it
terraformlib plan -c config.yaml -m manifest.yaml -s tf-root-k8s-cluster

# Deploy it
terraformlib apply -s tf-root-k8s-cluster

# Deploy apps separately
k8slib helm install -c configuration.yaml

# Kill it
terraformlib destroy -s tf-root-k8s-cluster
```

## Direct terraform

```bash
terraform init
terraform apply -var-file=.terraform/terraform.json
```

## Development

```bash
pip install pre-commit checkov
pre-commit install
pre-commit run --all-files
```

Checkov runs security scans on Terraform code to catch issues early.

## Variables

- `namespace` - Where to put your stuff
- `cluster.name` - What to call your cluster
- `cluster.ports` - Ports to expose (like {grafana: 30080})
