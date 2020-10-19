#!/bin/bash

args=("$@")
cd $(dirname ${0})

TMP_DIR=$(mktemp -d -t ufc-charts)
mkdir -p docs && cd docs

for ((i = 0; i < $#; i++)); do
  echo "packing: ufc/${args[$i]}"
  helm package "../ufc/${args[$i]}"
done

cd ..
for i in $(ls "${TMP_DIR}"); do
  mv "docs/${i}" "${TMP_DIR}/"
done

git checkout gh-pages
mkdir -p docs
for i in $(ls "${TMP_DIR}"); do
  mv "${TMP_DIR}/${i}" ./docs/
done

echo "indexing https://unionfab.github.io/charts/"
cd docs && helm repo index . --url https://unionfab.github.io/charts/
