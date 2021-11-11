#!/bin/bash

yq eval -o=json manifests/ingress.yaml > input.json

opa eval \
  --format pretty \
  --fail-defined \
  --data policies/ \
  --data data/ \
  --input input.json "data.ingress.analysis.deny[x]"
