# /bin/bash

set -ex

git apply .beagle/v24.3.0-beagle.patch

export VERSION="v24.9.2"
export GIT_COMMIT=$(git rev-parse --short HEAD)

VERSION_PKG=github.com/NVIDIA/gpu-operator/internal/info

CGO_ENABLED=0
GOOS=linux
go build -ldflags "-s -w -X $VERSION_PKG.gitCommit=$GIT_COMMIT -X $VERSION_PKG.version=$VERSION" -o bin/gpu-operator ./cmd/gpu-operator/...

git apply -R .beagle/v24.3.0-beagle.patch
