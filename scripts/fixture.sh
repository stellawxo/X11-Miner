#!/bin/bash

RELEASE_BIN="$(git rev-parse --show-toplevel)/bin"

function display {
  echo "⛏  $1"
  echo
}
# Fix File Permission for binaires
for file in $(ls ${RELEASE_BIN}/*/cgminer*); do
  display "Fix Permission for ${file}..."
  chmod a+x ${file}
  ls -l ${file}
done