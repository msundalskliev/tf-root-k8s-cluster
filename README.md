# tf-root-k8s-cluster

Spins up a Kind cluster with whatever you need.

## What you get

- Kind cluster with ports you specify
- Kubernetes namespace
- Optional Helm chart deployment

## Usage

```bash
# Plan it
terraformlib plan -c config.yaml -m manifest.yaml -s tf-root-k8s-cluster

# Deploy it
terraformlib apply -s tf-root-k8s-cluster

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
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

## Variables

- `namespace` - Where to put your stuff
- `cluster.name` - What to call your cluster
- `cluster.ports` - Ports to expose (like {grafana: 30080})
- `helm_chart.enabled` - Deploy a chart or not
- `helm_chart.name` - Chart name
- `helm_chart.path` - Where to find it
- `helm_chart.values` - Chart config