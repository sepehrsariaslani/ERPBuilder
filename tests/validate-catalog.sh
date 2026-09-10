#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

jq -e '.components | length > 0' "$root/erp-ui-builder/references/component-index.json" >/dev/null
jq -e '.components[] | select(.name == "SmartDataTable" and .path == "frontend/src/components/shared/SmartDataTable.vue")' "$root/erp-ui-builder/references/component-index.json" >/dev/null
rg -q 'SmartDataTable' "$root/erp-ui-builder/references/component-guide.md"
rg -q 'frontend/src/components/shared' "$root/erp-ui-builder/references/directory-map.md"
