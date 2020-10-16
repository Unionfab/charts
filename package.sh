#!/bin/bash

cd $(dirname ${0})

mkdir -p docs && cd docs

for c in $(ls ../ufc); do
  echo "packing ufc/${c}"
  helm package ../ufc/${c}
done

helm repo index . --url https://unionfab.github.io/charts/

TMP_DIR=$(mktemp -d -t ufc-charts.XXXXXXXXXX)
cd .. && mv docs/* ${TMP_DIR}
git checkout gh-pages && rm -rf docs && mv ${TMP_DIR} ./docs
