#!/bin/bash
set -e

echo "Testing Terraform module..."

# Test 1: Terraform validation
echo "Running terraform validate..."
terraform validate

# Test 2: Extract values from terraform.json if it exists
if [ -f ".terraform/terraform.json" ]; then
    CLUSTER_NAME=$(grep -o '"name"[[:space:]]*:[[:space:]]*"[^"]*"' .terraform/terraform.json | head -1 | cut -d'"' -f4)
    NAMESPACE_NAME=$(grep -o '"namespace"[[:space:]]*:[[:space:]]*"[^"]*"' .terraform/terraform.json | cut -d'"' -f4)
else
    echo "ERROR: No .terraform/terraform.json found"
    echo "Run: terraformlib plan first"
    exit 1
fi

echo "Testing cluster: $CLUSTER_NAME"
echo "Testing namespace: $NAMESPACE_NAME"

# Test 3: Check if cluster exists and is accessible
echo "Testing cluster connectivity..."
if ! kubectl cluster-info --context kind-$CLUSTER_NAME > /dev/null 2>&1; then
    echo "ERROR: Cluster '$CLUSTER_NAME' not accessible"
    echo "Run: terraformlib apply -s ."
    exit 1
fi

# Test 4: Check namespace exists
echo "Testing namespace..."
if ! kubectl get namespace $NAMESPACE_NAME > /dev/null 2>&1; then
    echo "ERROR: Namespace '$NAMESPACE_NAME' not found"
    exit 1
fi

# Test 5: Basic kubectl operations
echo "Testing kubectl operations..."
kubectl get nodes --context kind-$CLUSTER_NAME > /dev/null
kubectl get pods -n $NAMESPACE_NAME --context kind-$CLUSTER_NAME > /dev/null

echo "All tests passed!"
echo ""
echo "Cluster '$CLUSTER_NAME' ready for:"
echo "  - Helm deployments via k8slib"
echo "  - Direct kubectl operations"
echo "  - Namespace: $NAMESPACE_NAME"