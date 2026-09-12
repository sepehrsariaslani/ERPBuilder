#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for file in SKILL.md agents/openai.yaml references/hesabyar-ui-catalog.md scripts/scan-ui-context.sh; do
  [[ -f "$root/erp-ui-builder/$file" ]]
done
rg -q 'find-ui-component.sh' "$root/erp-ui-builder/SKILL.md"
rg -q '^## نصب$' "$root/README.md"
rg -q -- '--argjson canonical' "$root/README.md"
rg -q 'tests/scan-ui-context.test.sh' "$root/README.md"
