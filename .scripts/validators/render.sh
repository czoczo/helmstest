#!/bin/bash

# assume success
EXIT_CODE=0

# find Chart.yaml files
while read -d $'\0' CHART_FILE; do

  # assume folder containing Chart.yaml are Helm Charts and validate them
  CHART_DIR="$(dirname "${CHART_FILE}")"
  helm lint "$CHART_DIR" || EXIT_CODE=1

done < <(find . -name 'Chart.yaml' -print0)

exit $EXIT_CODE
