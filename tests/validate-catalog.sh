#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [[ -n "${ERP_UI_SOURCE_ROOT:-}" ]]; then
  source_root="$ERP_UI_SOURCE_ROOT"
elif [[ -d "$root/../accounts/frontend/src" ]]; then
  source_root="$root/../accounts/frontend/src"
else
  printf 'SKIP: catalog validation requires ERP_UI_SOURCE_ROOT (the frontend/src directory); no sibling accounts checkout was found.\n' >&2
  exit 2
fi

components_root="$source_root/components"
if [[ ! -d "$components_root" ]]; then
  printf 'SKIP: ERP_UI_SOURCE_ROOT must point to frontend/src containing components/.\n' >&2
  exit 2
fi

expected_index="$(mktemp)"
trap 'rm -f "$expected_index"' EXIT

jq -e '.components | length > 0' "$root/erp-ui-builder/references/component-index.json" >/dev/null
jq -e '.components[] | select(.name == "SmartDataTable" and .path == "frontend/src/components/shared/SmartDataTable.vue")' "$root/erp-ui-builder/references/component-index.json" >/dev/null
rg -q 'AssetReports.*frontend/src/pages/AssetReports.vue|frontend/src/pages/AssetReports.vue' "$root/erp-ui-builder/references/component-guide.md"
rg -q 'frontend/src/components/shared' "$root/erp-ui-builder/references/directory-map.md"

rg --files "$components_root" -g '*.vue' | sed "s#^$source_root/##" | sed 's#^#frontend/src/#' | sort | jq -R -s '
  split("\n")
  | map(select(length > 0) | (split("/")) as $segments | {
      name: ($segments[-1] | sub("\\.vue$"; "")),
      path: ($segments | join("/")),
      category: (if ($segments | length) > 4 then $segments[3] else "root" end)
    })
  | {components: .}
' > "$expected_index"
diff -u "$expected_index" "$root/erp-ui-builder/references/component-index.json"

jq -r '.components[].path' "$root/erp-ui-builder/references/component-index.json" |
  while IFS= read -r path; do
    test -f "$source_root/${path#frontend/src/}"
  done

canonical_names=(
  GenericListView ProcurementListPage PersianDateInput SearchableDropdown SmartDataTable
  EditableTable DocumentEditableTable PartyDetailShell DashboardShell AssetReports PageHeader
  Button IconButton MetricCard AppStatusBadge StatePanel Skeleton Tooltip Toast
  ResizableSidePanel ReportDocumentSidePanel DocumentTabs DocumentActionDrawer
  DocumentActivityButton DocumentSidebarSection FileChecklistSection KpiCard
  UxProgressiveDisclosure StatusBadge PageBreadcrumbs ProcessDocumentHeader DocumentPageShell
)
for name in "${canonical_names[@]}"; do
  rg -Fqx "## $name" "$root/erp-ui-builder/references/component-guide.md"
done
