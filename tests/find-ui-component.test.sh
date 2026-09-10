#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output="$($root/erp-ui-builder/scripts/find-ui-component.sh SmartDataTable)"
[[ "$output" == *"SmartDataTable"* ]]
[[ "$output" == *"frontend/src/components/shared/SmartDataTable.vue"* ]]
"$root/erp-ui-builder/scripts/find-ui-component.sh" nonexistent-component >/dev/null 2>&1 && exit 1 || true
