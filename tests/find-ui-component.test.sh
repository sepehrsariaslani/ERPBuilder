#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output="$($root/erp-ui-builder/scripts/find-ui-component.sh SmartDataTable)"
[[ "$output" == *"SmartDataTable"* ]]
[[ "$output" == *"frontend/src/components/shared/SmartDataTable.vue"* ]]
[[ "$output" == *"references/component-guide.md#smartdatatable"* ]]
if "$root/erp-ui-builder/scripts/find-ui-component.sh" nonexistent-component >/dev/null 2>&1; then
  exit 1
fi
