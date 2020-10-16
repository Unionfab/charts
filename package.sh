#!/bin/bash

cd $(dirname ${0})
mkdir -p docs
cd docs

for c in $(ls ../ufc); do
  echo "packing ufc/${c}"
  helm package ../ufc/${c}
done

helm repo index . --url https://unionfab.github.io/charts/
