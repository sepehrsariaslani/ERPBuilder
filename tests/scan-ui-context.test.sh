#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fixture="$(mktemp -d)"
trap 'rm -rf "$fixture"' EXIT

source_root="$fixture/repository/frontend/src"
mkdir -p \
  "$source_root/pages/procurement" \
  "$source_root/components/procurement" \
  "$source_root/components/shared" \
  "$source_root/services" \
  "$fixture/bin"
touch \
  "$source_root/pages/procurement/PurchaseOrders.vue" \
  "$source_root/components/procurement/PurchaseOrderPanel.vue" \
  "$source_root/components/shared/SmartDataTable.vue" \
  "$source_root/services/PurchaseOrderService.ts" \
  "$source_root/services/InventoryService.ts"

cat >"$fixture/bin/find" <<'EOF'
#!/usr/bin/env bash
for argument in "$@"; do
  [[ "$argument" != '-printf' ]] || exit 73
done
exec /usr/bin/find "$@"
EOF
chmod +x "$fixture/bin/find"

output="$(PATH="$fixture/bin:$PATH" "$root/erp-ui-builder/scripts/scan-ui-context.sh" procurement "$source_root")"
grep -Fqx 'frontend/src/pages/procurement' <<<"$output"
grep -Fqx 'frontend/src/pages/procurement/PurchaseOrders.vue' <<<"$output"
grep -Fqx 'frontend/src/components/procurement' <<<"$output"
grep -Fqx 'frontend/src/components/procurement/PurchaseOrderPanel.vue' <<<"$output"
grep -Fqx 'frontend/src/components/shared/SmartDataTable.vue' <<<"$output"
grep -Fqx 'frontend/src/services' <<<"$output"
grep -Fqx 'frontend/src/services/PurchaseOrderService.ts' <<<"$output"
if grep -Fqx 'frontend/src/services/InventoryService.ts' <<<"$output"; then
  exit 1
fi
