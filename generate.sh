#!/usr/bin/env bash

set -eu
set -o pipefail

# convert lines into a JSON list with jq
# https://stackoverflow.com/a/28006220
# shellcheck disable=SC2012
ls -1 modules | sort -u | jq -R -s 'split("\n")[:-1]' > renovate/modules.json

jsonnet -o renovate.json renovate/main.jsonnet
