# git

<https://github.com/NVIDIA/gpu-operator>

```bash
git remote add upstream git@github.com:NVIDIA/gpu-operator.git

git fetch upstream

git merge v24.9.2
```

## charts

```bash
# 1. Package
helm package ./deployments/gpu-operator && \ 
mv gpu-operator-v1.0.0-devel.tgz bin/gpu-operator-v1.0.0-devel.tgz

# 2. Deploy
helm install \
  --namespace=beagle-system \
  gpu-operator \
  --version=v24.9.2 \
  /etc/kubernetes/charts/gpu-operator-v1.0.0-devel.tgz \
  -f /etc/kubernetes/charts/gpu-operator-v1.0.0-devel.yaml

# 3. Upgrade
helm upgrade \
  --namespace=beagle-system \
  gpu-operator \
  --version=v24.9.2 \
  /etc/kubernetes/charts/gpu-operator-v1.0.0-devel.tgz \
  -f /etc/kubernetes/charts/gpu-operator-v1.0.0-devel.yaml

# 4. Uninstall
helm uninstall \
  --namespace=beagle-system \
  gpu-operator
```

## images

```bash
# https://catalog.ngc.nvidia.com/orgs/nvidia/teams/cloud-native/containers/gpu-operator-validator/tags
nvcr.io/nvidia/cloud-native/gpu-operator-validator:v24.9.2
```
