# Hesabyar UI Catalog

Read the section matching the page you are building. These paths are implementation references, not templates to copy wholesale.

## Design System

- `frontend/src/design-system/tokens.js`: canonical color, typography, spacing, radius, shadow, density, motion, RTL direction, and module-accent tokens.
- `frontend/src/design-system/themeContract.js` and `themeRuntime.js`: light/dark, density, and RTL/LTR runtime contracts. The default direction is RTL.
- `frontend/src/design-system/stateContract.js`: semantic states and their accessible behavior.
- `frontend/src/components/design/`: base components: `Button`, `IconButton`, `Checkbox`, `Radio`, `Switch`, `Dropdown`, `Popover`, `Tooltip`, `Toast`, `Skeleton`, `StatePanel`, `PageHeader`, `MetricCard`, `AppStatusBadge`, `InfoCell`, and `TableCellRenderer`.
- `frontend/src/components/design/index.js`: named exports for the primary display components.
- `frontend/src/ux-core/pageContracts.js`: normalized page contract for `list`, `detail`, `create`, `report`, `workspace`, and `settings` page types.
- `frontend/src/ux-core/accessibility.js`: direction, interactive, and status accessibility contracts.

Before writing local CSS or a local primitive, check these files. Use semantic intent colors for status and feedback, the configured density for operational surfaces, and the supplied RTL settings. Preserve the existing token values rather than adding arbitrary page-level colors, spacing, radii, z-indexes, or animations.

## Operational Lists

- `frontend/src/components/shared/GenericListView.vue`: base list pattern with saved views, search, filters, table/card/calendar rendering, bulk selection, slots, and row-click events.
- `frontend/src/components/procurement/foundation/ProcurementListPage.vue`: procurement wrapper around `GenericListView`; adds canonical assignment, workflow, and bulk-operation panels.
- `frontend/src/pages/procurement/PurchaseInvoices.vue`: preferred purchase-invoice list. Shows columns, quick filters, actions, status slots, cards, and routing to the document.

Use this pattern for operational record collections such as invoices, orders, work orders, corrections, receipts, and master data. Do not render a second custom table alongside `GenericListView`.

## Ledger and Analytical Reports

- `frontend/src/pages/GeneralLedger.vue`: accounting-report structure: concise header, grouped filters, `PersianDateInput`, `SearchableDropdown`, apply/reset commands, and a dense `SmartDataTable` transaction result surface.
- `frontend/src/pages/manufacturing/work-order/WorkOrderStockLedger.vue`: focused inventory-ledger drill-down with summary metrics and a transaction table.

Use this structure when users compare balances, trace transactions, or export a report. Dates must use `PersianDateInput`; accounts, parties, products, warehouses, and similar large data sets must use `SearchableDropdown`; report-result tables must use `SmartDataTable` with appropriate frozen, filterable, resizable, and row-click drill-down settings. Quantity and stock-effect columns use `float` or `number` so fractional values remain visible; currency columns retain their accounting precision.

## Asset Reports

- `frontend/src/pages/AssetReports.vue`: canonical asset-report workflow: choose a report, show compact filters, run it, display summary values, then show a filterable result table.
- `frontend/src/assetsConfig.js`: asset report metadata. `reportName` is an internal ERPNext identifier; `title` and `description` are the Persian user-facing text.
- `frontend/src/pages/AssetModule.vue`: asset module entry and navigation context.

Use this pattern for reports about fixed assets, depreciation, maintenance, asset activity, lifecycle, and asset cost. Keep the report selector, filters, execution action, result summary, export, and table in one coherent workflow. User-facing text must stay Persian even if the ERPNext report identifier is English.

## Purchase Documents

- `frontend/src/pages/procurement/PurchaseInvoice.vue`: purchase invoice document surface.
- `frontend/src/components/procurement/PurchaseInvoiceSummary.vue`: invoice totals and payable summary.
- `frontend/src/components/procurement/PurchaseInvoiceFlowView.vue`: lifecycle and ledger/related-document view.
- `frontend/src/components/procurement/foundation/ProcurementItemsEditor.vue`: standard editable procurement item rows.

Use document actions only when their ERP state transition is supported by the server. Keep financial totals and line-item editing in their existing components.

## 360-Degree Entity Pages

- `frontend/src/pages/EmployeeDetail.vue`: primary 360-degree reference. It composes employee overview, Persian search/date controls, KPI cards, attendance history, onboarding, financial information, document activity, connections, contracts, leave, and file-completeness workflows.
- `frontend/src/components/party/PartyDetailShell.vue`: canonical shell for employee, customer, supplier, and partner detail pages. It provides RTL page context, breadcrumb, header, primary action, action drawer, KPI slots, progressive tabs, optional sidebar, and mobile action bar.
- `frontend/src/components/document/DocumentTabs.vue`: tab navigation for entity sections.
- `frontend/src/components/document/KpiCard.vue`: compact operational KPI card.
- `frontend/src/components/document/DocumentSidebarSection.vue`: sidebar sections.
- `frontend/src/components/party/FileChecklistSection.vue`: record-completeness and file checklist.
- `frontend/src/components/activity/DocumentActivityButton.vue` and `RecentActivitySection.vue`: document activity and history.
- `frontend/src/components/hr/EmployeeAttendanceTab.vue`, `EmployeeContractTab.vue`, `EmployeeConnectionsTab.vue`, `EmployeeLeaveAllocationPanel.vue`, `EmployeeHolidayAssignmentsTab.vue`, `EmployeeBreakAssignmentsTab.vue`, and `EmployeeOnboardingCard.vue`: employee-specific 360 panels.
- `frontend/src/components/ResizableSidePanel.vue` and `frontend/src/components/shared/SmartDataTable.vue`: detailed drill-down and dense related-record views.

Use `PartyDetailShell` as the default 360 foundation. Keep the overview focused, put substantial domain areas in named tabs, provide a checklist/activity surface in the sidebar, and disclose advanced tabs progressively. Reuse employee panels only for employee data; other entities reuse the shell and supply their own domain tabs.

## Sales Dashboards

- `frontend/src/components/dashboard/DashboardShell.vue`: standard dashboard runtime and context management.
- `frontend/src/components/sales/dashboard/SalesDashboardPage.vue`: sales dashboard entry point using `DashboardShell`.
- `frontend/src/components/sales/dashboard/SalesDashboardFilters.vue`: sales filter controls and shared selection behavior.
- `frontend/src/pages/sales/SalesModuleDashboard.vue`: module-level sales navigation.

Use dashboard KPI cards to summarize a decision, then place trend, composition, exception, and drill-down views beneath them. A dashboard should support scanning and action, not behave like a landing page.

## Inputs, Tables, and Detail Panels

- `frontend/src/components/shared/PersianDateInput.vue`: canonical date input, backed by `JalaliDatePicker`; model remains ISO/Gregorian for ERP APIs.
- `frontend/src/components/shared/SearchableDropdown.vue`: searchable selector for long data sets.
- `frontend/src/components/shared/EditableTable.vue`: editable child table.
- `frontend/src/components/document/DocumentEditableTable.vue`: document-oriented editable child table.
- `frontend/src/components/shared/SmartDataTable.vue`: standard dense report table with sorting, column filters, resizing, frozen columns, totals, and row-click drill-down.
- `frontend/src/components/ResizableSidePanel.vue`: reusable side panel for record detail and actions.
- `frontend/src/components/ReportDocumentSidePanel.vue`: report drill-down panel.
- `frontend/src/components/shared/StatusBadge.vue`: status display.
- `frontend/src/components/document/PageBreadcrumbs.vue`: document/list navigation context.

For formula and inventory correction reports, add an aggregated impact table before the detailed rows. Include only changed items with old consumption, new consumption, delta, and the inverse inventory effect. On desktop, operational pages should use the full available workspace width rather than a narrow `max-w-*` content column; preserve responsive page padding and table scrolling on smaller screens.

## Directory and Layout Rules

- First inspect the sibling pages and components in the business domain that owns the feature. Reuse that module's API service, naming, and layout structure.
- Use `pages/` for route-level composition and `components/` for reusable view pieces. Place shared behaviour in the existing shared/document/dashboard/table directories rather than creating duplicate foundations.
- Lay out operational screens in reading order: context and commands, filters, summaries, primary data, then detail or corrective actions. Keep page bands unframed; reserve cards for individual summary values, repeated records, and modal/panel tools.
- Render all user-facing text in Persian. Retain English only for code, route/API identifiers, and values the ERP must send to its backend.
