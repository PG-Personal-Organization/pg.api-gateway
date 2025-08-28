#!/usr/bin/env bash
set -euo pipefail
REGISTRY="localhost:5000"
MODULE="pg.api-gateway"   # change per service
TAG="1.0.0"

IMAGE="${REGISTRY}/${MODULE}:${TAG}"

docker build \
  --build-arg MODULE="${MODULE}" \
  -t "${IMAGE}" .

docker push "${IMAGE}"
