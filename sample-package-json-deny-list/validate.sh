#!/bin/bash

opa eval \
  --format pretty \
  --fail-defined \
  --data policies/ \
  --input data/package.json "data.packages.analysis.deny[x]"
