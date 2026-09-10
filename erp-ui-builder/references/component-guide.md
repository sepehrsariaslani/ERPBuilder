# Canonical Hesabyar component guide

Use canonical components before adding page-local primitives. Paths are relative to the accounts app root. “Invocation” means import the component and supply its documented props/events; use the named slots listed by the component instead of duplicating its internal layout.

## GenericListView

- **When:** operational record collections.
- **Path:** `frontend/src/components/shared/GenericListView.vue`
- **Invocation/slots:** configure columns, filters, quick filters, row-click navigation, and slot renderers for special cells.
- **Do not substitute:** a second page-local table for the same records.

## ProcurementListPage

- **When:** procurement document lists needing shared bulk panels and quick filters.
- **Path:** `frontend/src/components/procurement/foundation/ProcurementListPage.vue`
- **Invocation/slots:** provide document-specific status, amount, and action renderers through its list slots.
- **Do not substitute:** a hand-assembled procurement list that reimplements shared bulk behavior.

## PersianDateInput

- **When:** Persian-facing date filters and document dates.
- **Path:** `frontend/src/components/shared/PersianDateInput.vue`
- **Invocation/slots:** bind the ERP ISO API model value; expose a Persian label and let the control render the Persian date.
- **Do not substitute:** a plain text/date input with manually formatted Jalali strings.

## SearchableDropdown

- **When:** long product, account, party, BOM, warehouse, or similar option sets.
- **Path:** `frontend/src/components/shared/SearchableDropdown.vue`
- **Invocation/slots:** provide `search-fn`, placeholder, `label-field`, and `value-field`; use its option rendering hooks when needed.
- **Do not substitute:** an unsearchable native select for a large data set.

## SmartDataTable

- **When:** ledger, reconciliation, analysis, and report-result tables.
- **Path:** `frontend/src/components/shared/SmartDataTable.vue`
- **Invocation/slots:** configure columns, frozen columns, widths, filters, totals, and row-click drill-down; mark quantity/rate/inventory columns `float` or `number` and only set `decimals` for a business rule.
- **Do not substitute:** a hand-built `<table>` or integer rounding for stock quantities.

## EditableTable

- **When:** editable child rows outside document-specific flows.
- **Path:** `frontend/src/components/shared/EditableTable.vue`
- **Invocation/slots:** keep stable column widths and put search controls in the relevant cell slot.
- **Do not substitute:** independently managed inline-row markup.

## DocumentEditableTable

- **When:** editable document line items.
- **Path:** `frontend/src/components/document/DocumentEditableTable.vue`
- **Invocation/slots:** supply line-item cell slots and preserve the table's stable widths and editing contract.
- **Do not substitute:** a generic form stack for document lines.

## PartyDetailShell

- **When:** 360-degree customer, supplier, employee, or partner pages.
- **Path:** `frontend/src/components/party/PartyDetailShell.vue`
- **Invocation/slots:** compose Persian header/actions, KPI row, progressive tabs, overview, related activity, and file sidebar through shell slots.
- **Do not substitute:** a separate page-local 360 layout.

## DashboardShell

- **When:** operational dashboards.
- **Path:** `frontend/src/components/dashboard/DashboardShell.vue`
- **Invocation/slots:** put key measures, then question-answering charts/tables in its dashboard regions.
- **Do not substitute:** a marketing hero or isolated KPI-card wall.

## AssetReports

- **When:** asset report selection and execution.
- **Path:** `frontend/src/pages/assets/AssetReports.vue`
- **Invocation/slots:** follow its compact filter surface, single run action, post-run summary, and dense result-table workflow; keep report IDs internal.
- **Do not substitute:** a generic dashboard that exposes English report-engine names.

## PageHeader

- **When:** page context and primary actions.
- **Path:** `frontend/src/components/design/PageHeader.vue`
- **Invocation/slots:** supply Persian title, context, and the existing action region.
- **Do not substitute:** an ad-hoc heading/action bar.

## Button and IconButton

- **When:** visible actions and compact, non-critical icon actions.
- **Path:** `frontend/src/components/design/Button.vue`; `frontend/src/components/design/IconButton.vue`
- **Invocation/slots:** use semantic variant/loading state; provide a Persian tooltip or accessible label for icon-only use.
- **Do not substitute:** raw buttons or critical tiny icon-only controls.

## MetricCard

- **When:** a key operational measure.
- **Path:** `frontend/src/components/design/MetricCard.vue`
- **Invocation/slots:** provide one concise metric and contextual label; place it in the page KPI row.
- **Do not substitute:** a decorative card grid for every value.

## AppStatusBadge and StatusBadge

- **When:** concise lifecycle or operational status.
- **Path:** `frontend/src/components/design/AppStatusBadge.vue`; `frontend/src/components/shared/StatusBadge.vue`
- **Invocation/slots:** pass the established semantic status and Persian text; retain the surrounding formatter where one exists.
- **Do not substitute:** color alone or locally invented status styling.

## StatePanel and Skeleton

- **When:** empty/error/actionable states and loading placeholders.
- **Path:** `frontend/src/components/design/StatePanel.vue`; `frontend/src/components/design/Skeleton.vue`
- **Invocation/slots:** supply an honest Persian state and next action; use skeletons only while data is loading.
- **Do not substitute:** a success toast as the only evidence of a long-running result.

## Tooltip and Toast

- **When:** icon explanation and transient feedback.
- **Path:** `frontend/src/components/design/Tooltip.vue`; `frontend/src/components/design/Toast.vue`
- **Invocation/slots:** wrap unclear icons with a Persian tooltip; use toast for confirmation alongside persistent workflow state.
- **Do not substitute:** unlabeled icons or toast-only financial/inventory completion feedback.

## ResizableSidePanel and ReportDocumentSidePanel

- **When:** row details, previews, and related-document inspection.
- **Path:** `frontend/src/components/ResizableSidePanel.vue`; `frontend/src/components/ReportDocumentSidePanel.vue`
- **Invocation/slots:** open from predictable row-click targets and render detail content in the panel slot.
- **Do not substitute:** an unrelated modal or a second detail page without a clear row target.

## DocumentTabs

- **When:** progressive sections of a document or 360 view.
- **Path:** `frontend/src/components/document/DocumentTabs.vue`
- **Invocation/slots:** register focused tabs and keep advanced ones behind progressive disclosure when needed.
- **Do not substitute:** an overloaded first view containing every section.

## DocumentActionDrawer

- **When:** document secondary operations.
- **Path:** `frontend/src/components/DocumentActionDrawer.vue`
- **Invocation/slots:** keep primary lifecycle actions visible in the header and pass secondary actions to the drawer.
- **Do not substitute:** an unstructured action menu or direct deletion of a submitted document.

## DocumentActivityButton

- **When:** opening a document's activity surface.
- **Path:** `frontend/src/components/activity/DocumentActivityButton.vue`
- **Invocation/slots:** use through the document/party shell action area and preserve its activity target.
- **Do not substitute:** a page-local activity trigger with separate state.

## DocumentSidebarSection and FileChecklistSection

- **When:** supporting detail and file/completeness checks on document or party pages.
- **Path:** `frontend/src/components/document/DocumentSidebarSection.vue`; `frontend/src/components/party/FileChecklistSection.vue`
- **Invocation/slots:** compose them in the shell sidebar and keep supporting detail out of the primary workflow.
- **Do not substitute:** nested floating cards in the main form.

## KpiCard

- **When:** document/party KPI rows inside the 360 shell.
- **Path:** `frontend/src/components/document/KpiCard.vue`
- **Invocation/slots:** pass one operational KPI in the shell's KPI region.
- **Do not substitute:** a separate KPI layout that competes with `PartyDetailShell`.

## UxProgressiveDisclosure

- **When:** advanced content would overload the initial view.
- **Path:** `frontend/src/components/ux-core/UxProgressiveDisclosure.vue`
- **Invocation/slots:** place optional controls or tabs in its disclosed content slot and retain a clear Persian trigger.
- **Do not substitute:** an always-expanded filter wall.

## PageBreadcrumbs

- **When:** every document detail page.
- **Path:** `frontend/src/components/document/PageBreadcrumbs.vue`
- **Invocation/slots:** place above the document header with the native document hierarchy.
- **Do not substitute:** a custom text trail or omitted hierarchy.

## ProcessDocumentHeader and DocumentPageShell

- **When:** multi-stage payroll, fulfillment, production, BOM-correction, and work-order documents.
- **Path:** `frontend/src/components/document/ProcessDocumentHeader.vue`; `frontend/src/components/document/DocumentPageShell.vue`
- **Invocation/slots:** use full desktop width and provide `moduleTone`, breadcrumbs, steps, current step, primary/secondary actions, `printDoctype`, and `printName`; keep domain transitions/calculations in the page.
- **Do not substitute:** a narrow local header or a duplicate print workflow.
