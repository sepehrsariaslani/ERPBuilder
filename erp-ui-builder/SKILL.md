---
name: erp-ui-builder
description: Use when building or refining Hesabyar Vue pages, reports, dashboards, documents, lists, filters, tables, or right-to-left Persian ERP interfaces in the accounts app.
---

# ERP UI Builder

Build Hesabyar pages as operational ERP tools: clear hierarchy, compact scanning, predictable filters, and direct actions. Reuse the app's canonical components before creating a local substitute. The visible interface is Persian and right-to-left by default.

## Apple-Inspired ERP Design Review

Apply the eight principles in [principles](references/apple-erp/principles.md) to new pages, components, and design reviews. This adapts Apple's design philosophy to Hesabyar's web ERP; it does not copy iOS/macOS chrome or replace native Frappe/ERPNext behavior. The existing token values, canonical components, page contracts, and business permissions remain authoritative. Review the complete task flow, including progress, failure, recovery, and completion, not just the first screen.

For a significant new page, redesign, design-system change, dashboard, or shared component, also read [design masters](references/apple-erp/design-masters.md). It translates documented work from Steve Jobs, Jony Ive, Bill Atkinson, Susan Kare, Jef Raskin, Larry Tesler, Don Norman, Bruce Tognazzini, Dieter Rams, Hartmut Esslinger/frog, modern Apple Human Interface Design, Edward Tufte, and Nielsen/Molich into operational ERP checks. These are lenses, not visual styles or personality authority: never justify a decision only by a designer's name, and never sacrifice auditability, permissions, accessibility, or business correctness for aesthetic purity.

Identify the page kind before loading design guidance. Read [information hierarchy](references/apple-erp/information-hierarchy.md), then only the relevant topic files under `references/apple-erp/`: `document-pages`, `list-pages`, `tables`, `forms`, `dashboards`, `charts-data`, `navigation`, `planning`, `kanban`, `gantt`, `status-feedback`, `actions`, `accessibility`, `writing`, `motion`, `responsive-mobile`, `performance`, `complexity-management`, and `design-tokens`. For a focused review, use [review rubric](references/apple-erp/review-rubric.md) and cite the exact local rule and observed evidence. A source-only review cannot claim measured contrast, keyboard behavior, or authenticated runtime success.

Use [complexity management](references/apple-erp/complexity-management.md) when a workflow has many fields, states, roles, or decisions: the interface should absorb mechanical work while keeping business rules, provenance, permissions, and audit evidence accessible. The `ui-ux-pro-max` reference contributes targeted web UX checks; its style generators, palette presets, fixed native touch sizes, and automatic `design-system/MASTER.md` generation do not supersede Hesabyar's live tokens and Showcase.

The layer mapping is foundations (existing tokens/theme) → primitives (`components/design` and shared controls) → ERP compositions (`components/document`, `table`, `dashboard`, and domain owners) → patterns (Showcase catalog) → page shells (existing templates and page contracts). These are conceptual layers inside the current governance model, not new parallel folders or a mandate to create every named component. Search catalog, inventory, and nearby module code before extending a component or shell; add a new canonical contract only for a demonstrated shared need.

## Inspect the Module First

Before designing or editing a page, inspect the closest route, page, components, and relevant documentation in the same module. Follow the repository ownership pattern:

- Run `scripts/scan-ui-context.sh <domain>` from the frontend root for a compact map of the relevant page, component, and service directories. Use it before broad file searches; it deliberately limits output to avoid loading an unnecessary project-wide file list.
- Pages live under `frontend/src/pages/`, with domain pages in their matching subdirectory such as `pages/finance`, `pages/procurement`, `pages/sales`, or `pages/manufacturing`.
- Reusable domain components live under `frontend/src/components/<domain>/`; cross-domain components belong in `components/shared`, `components/document`, `components/dashboard`, or `components/table`.
- Keep API clients in `frontend/src/services/` and module configuration/definitions in their existing `config`, `dashboard`, or domain configuration location.
- Read the nearby page and component files before introducing a new directory or a local UI primitive. Create a new directory only when the feature owns several cohesive components.
- Keep a page's section order consistent: page context and actions, filters, summary, primary table/chart, then side-panel or drill-down detail. Do not turn every section into a floating card.

### Use the live Design System Showcase

The repository's Design System Showcase is the source of truth for reusable UI discovery and preview contracts:

- Read `frontend/src/design-system/showcase/catalog.js` before selecting a reusable component, pattern, or template; use the listed owner path and preview contract instead of inventing a parallel primitive.
- Read `frontend/src/design-system/showcase/inventory.js` when the task depends on page coverage, component usage, canonical paths, duplicate-name review, or manual-review pages. It is generated from the current `src/components/**/*.vue` and `src/pages/**/*.vue` topology.
- In development, the Vite Showcase inventory watcher refreshes that inventory after component/page add, change, or removal. After source changes, run the focused inventory check when you need a deterministic contract check; do not treat a stale generated file as evidence of current coverage.
- When adding a reusable component, add its catalog entry and preview harness branch (or an explicit page-owned preview for context-only components), then expose the usage path and exact source in the Showcase. Keep same-name implementations separate until source and ownership review proves they are true aliases.

## Directory Ownership and Incremental Cleanup

Treat directory ownership as part of the feature contract. Before creating or moving a file, identify its business module and place it beside the other files that own the same workflow. Do not reorganize the whole application as a prerequisite for a small feature, and do not create a second parallel directory convention.

For the Accounts frontend, use this ownership layout:

```text
frontend/src/
├── pages/<domain>/            # route-level screens
├── components/<domain>/      # reusable components owned by one domain
├── services/<domain>/        # API clients and transport adapters
├── dashboard/<domain>/       # dashboard definitions, providers, selectors, actions
├── config/<domain>/          # domain configuration and document catalogs
├── navigation/<domain>/      # only when navigation is not owned by the route installer
└── tests/<domain>/           # focused contracts and behavior tests
```

Cross-domain primitives belong in the existing shared owners: `components/design`, `components/shared`, `components/document`, `components/dashboard`, `components/table`, `composables`, or `services` only when the client is genuinely shared. Never create redundant paths such as `components/components`, `pages/pages`, `services/services`, or `utils/utils`.

For the Python side, keep business modules at the `accounts/<domain>/` boundary and prefer this internal shape when a domain has enough code to justify it:

```text
accounts/<domain>/
├── api/                       # thin whitelisted entrypoints and response shaping
├── services/                  # use-case orchestration
├── domain/                    # business rules and policies
├── queries/                   # read models and report queries
└── integrations/              # Frappe, ERPNext, provider, or external adapters
```

Keep Frappe-owned paths such as `accounts/hesab/doctype/`, `hooks.py`, `patches/`, fixtures, and report definitions in their required locations unless a deliberate metadata migration has been planned. Do not duplicate authoritative ERPNext DocTypes merely to make the directory look uniform.

`accounts/accounts_api.py` is a legacy public compatibility facade, not a place for new domain logic. When decomposing it, move coherent endpoint groups into their owning domain, preserve the public `accounts.accounts_api.<method>` paths through temporary wrappers, and remove wrappers only after callers, hooks, tests, permissions, and authenticated runtime behavior have been verified. New frontend work must call a domain-owned client under `services/<domain>/`, not add more endpoint strings to a page or to the legacy facade.

Every newly established domain should have a short `README.md` or module manifest that records its pages, routes, API clients, backend entrypoints, DocTypes, permissions, reports, jobs, and external integrations. This is a navigation map for developers; it is not a substitute for route or permission registration.

Directory cleanup is incremental: inventory references first, introduce the target owner, move one cohesive slice at a time, keep compatibility shims where public paths exist, move its tests with it, and delete an old location only after reference and runtime checks pass. A pure source reorganization does not by itself authorize migrate, restart, build, or deployment; assess those separately after the move.

## Choose the Page Pattern

Pick the pattern that matches the user's work, then inspect its reference before implementation:

- **Operational list:** Use `GenericListView`. For procurement documents, prefer `ProcurementListPage`, which adds the shared bulk panels and quick-filter behavior. Put document-specific status, amounts, and actions in slots rather than duplicating list mechanics.
- **Ledger or analysis report:** Use a dense filter surface above the results, with `PersianDateInput` for dates and `SearchableDropdown` for link/data sets. Use `SmartDataTable` as the standard report table. Keep totals, drill-downs, export, and the transaction table in the same workflow.
- **Document detail or data entry:** Use direct form labels and the canonical inputs. Use `EditableTable` or `DocumentEditableTable` for line items and a side panel for supporting detail, not nested cards.
- **360-degree entity page:** Use `PartyDetailShell` as the primary structure for connected entities such as employees, customers, suppliers, and partners. Compose it from a Persian header, primary and secondary actions, KPI row, progressive tabs, a focused overview, related-document/activity surfaces, and a file/completeness sidebar. Add domain-specific panels as tabs or slots; do not create a second standalone 360 layout.
- **Dashboard:** Prefer `DashboardShell` and the existing sales dashboard definitions. Use KPI cards only for key measures, then charts/tables that answer the next operational question. Do not create a marketing-style hero.
- **Asset report:** Follow the report-selection and execution pattern in `AssetReports.vue`: Persian report names, a compact filter area, one clear run action, summary after execution, and a dense result table. Keep report engine identifiers internal; never expose English report names to the user.

### Settings Page Pattern

- Whenever a settings page is requested, begin with the existing shared settings template—especially `SettingsSinglePage.vue` and the closest operational reference such as `ProcurementSettings.vue`—before considering a new layout.
- Keep the established settings contract: Persian RTL header and breadcrumbs, tabbed sections, shared `Button`/`StatePanel` feedback, refresh, explicit save action, visible unsaved state, permission-aware read-only behavior, and native backend persistence.
- Do not route a new settings workflow through a generic document detail shell or invent a one-off settings page when the shared settings pattern applies. Use `MetadataForm` inside that shell when the underlying DocType fields should remain metadata-driven.

## Canonical Component Rules

- Start with the design-system tokens and existing design components. Preserve the configured RTL direction, density, theme, spacing, radius, semantic intent colors, and stacking order instead of introducing page-local equivalents.
- Prefer `PageHeader`, `Button`, `IconButton`, `MetricCard`, `AppStatusBadge`, `StatePanel`, `Skeleton`, `Tooltip`, and `Toast` from `components/design` when they fit the existing page pattern.
- Use `PersianDateInput` for Persian-facing date filters and document dates. Store the model value as the ERP ISO date used by APIs.
- Use `SearchableDropdown` for products, accounts, parties, BOMs, warehouses, and other potentially long option sets. Provide a real `search-fn`, a visible placeholder, and matching `label-field` / `value-field`.
- For relational `SearchableDropdown` fields, keep the shared permission-aware create-on-no-results flow enabled and pass the linked DocType explicitly whenever it is available. After a successful empty search, open the shared Persian quick-create side panel; show only required fields first and provide a details view that loads the DocType's supported ordinary form fields while preserving every value already entered. Submit the expanded fields, retain unsaved-change protection, and select the created record back into the originating dropdown. Do not imply that the generic panel edits child tables or attachments; those need their native full form. Do not build a separate create panel in each page. Keep local enum/options selectors and sensitive system records non-creatable, and respect server create permission and full-form lifecycle requirements.
- Use direct Vue markup for form labels and controls. Do not place ordinary inputs inside locally-declared components that rely on a runtime `template` string.
- Use `GenericListView` for record collections. Configure columns, filters, quick filters, row-click navigation, and slot renderers; do not add a second custom table for the same records.
- Use `SmartDataTable` for ledger, reconciliation, analytical, and report-result tables. Configure its columns, frozen columns, widths, filters, totals, and row-click drill-down rather than hand-building a `<table>`.
- For `SmartDataTable` quantity, consumption, rate, and inventory-effect columns, use `type: 'float'` or `type: 'number'`. The shared table preserves up to 12 meaningful decimal places by default. Set `decimals` only when a business rule requires a stricter display precision; never round stock quantities to integers merely for display.
- Use `EditableTable` / `DocumentEditableTable` for editable child rows. Keep search controls in the relevant cell slot and preserve stable column widths.
- Use `ResizableSidePanel` or `ReportDocumentSidePanel` for row details, previews, and related-document inspection. A row click should have a predictable open target.
- On 360-degree pages, use `DocumentTabs`, `DocumentActionDrawer`, `DocumentActivityButton`, `DocumentSidebarSection`, `FileChecklistSection`, and `KpiCard` through the `PartyDetailShell` slots. Use `UxProgressiveDisclosure` when advanced tabs would otherwise overload the first view.
- Reuse `StatusBadge`, `PageBreadcrumbs`, shared buttons, and existing number/date formatters where relevant.
- For every document detail page, use `PageBreadcrumbs` above the document header and `DocumentActionDrawer` for secondary operations. Keep the primary lifecycle controls visible in the header: show `ذخیره` and `ثبت نهایی` for drafts, `لغو سند` for submitted documents, and `حذف سند` only for drafts or cancelled documents. A submitted document must never expose direct deletion; it must be cancelled first. Include `تکراری` for existing documents, and wire duplicate, cancel, and delete through the document's native backend lifecycle rather than reproducing domain logic in Vue.
- For multi-stage process documents such as Payroll Entry, Daily Fulfillment Session, Production BOM Correction Run, and Work Order, use `ProcessDocumentHeader` or the equivalent `DocumentPageShell` contract. It must use the full desktop workspace width, receive `moduleTone`, `breadcrumbs`, `steps`, `currentStep`, visible `primaryActions`, secondary `actions`, `printDoctype`, and `printName`. Use an HR tone for payroll, a sales tone for fulfillment, and a manufacturing tone for production flows. The header owns print-format selection and standard `printview`; domain pages retain their own workflow transitions and calculations.
- For BOM, formula, or inventory-correction analysis, place a compact aggregated-impact report before the detailed work-order table. Include only changed materials and show old consumption, new consumption, consumption delta, and the inverse effect on inventory. Explain the sign convention in Persian near the report.
- Derive an aggregate that depends on row selection from the selected work-order rows, not only from a stored analysis snapshot; the report must change immediately when the user changes the selection and must also render for older saved analyses.
- When the business requirement is a true historical BOM correction, rebuild each production in chronological order: cancel its previous production receipt and work order, then create the replacement work order and manufacture receipt with the original posting date and time. During this narrowly scoped operation, permit temporary negative stock only for the affected finished goods and BOM components, then restore every item setting immediately. Do not show unrelated manual-adjustment controls as the completion step; show the new production and receipt documents instead.
- The completion report for a historical rebuild must preserve the audit chain for each row: previous work order, previous manufacture receipt, replacement work order, replacement receipt, original timestamp, completion state, and any error. Keep summary counts above the same report table.

For a new page, use the existing page contract where it is already used: select the correct kind (`list`, `detail`, `create`, `report`, `workspace`, or `settings`), then populate its Persian title, actions, filters, states, and drill-down surfaces consistently.

## Persian-First Interface

- Set operational pages to `dir="rtl"` when their parent layout does not already provide it.
- Do not cap a desktop operational page to a narrow marketing-style container. Use the available workspace width (`w-full max-w-none`) for dense tables and dashboards; keep responsive page padding and horizontally scrollable tables so small viewports remain usable.
- All visible labels, placeholders, buttons, empty states, validation messages, table headings, actions, statuses, tooltips, and export labels must be Persian. Use established Hesabyar vocabulary consistently, such as `اعمال`, `پاک کردن`, `خروجی`, `جزئیات`, `از تاریخ`, and `تا تاریخ`.
- English technical values may remain internal: route names, component names, Doctype names, API methods, and report identifiers. Map them to Persian labels before rendering.
- Use Persian digits and local number/date formatting through the existing utilities where the surrounding page does so. Do not manually concatenate translated dates or currency values.
- For icons, supply a Persian tooltip or accessible label whenever the icon alone is not immediately obvious.

## Familiar Patterns and Change Management (Jakob's Law)

Users bring expectations from the Hesabyar screens and other familiar Persian ERP products. Let them spend their attention on accounting and operations—not on learning a new interface model.

- For a task that already has an established Hesabyar pattern, retain its familiar structure, labels, control types, action locations, row-click behavior, and feedback. Reuse the canonical component and page contract before proposing a new interaction.
- Treat recurring workflows—document lifecycle actions, list filters, search, table selection, exports, and side-panel details—as a cognitive contract. A visually novel treatment must not move or rename their core operation without a clear operational reason.
- Introduce a new interaction model only when it materially improves the ERP task and cannot be expressed with the established pattern. Keep its terminology, semantic colors, keyboard behavior, confirmations, and RTL layout consistent with the surrounding product.
- When a change alters a frequently used workflow, make the transition discoverable: preserve the previous task path where feasible, add a concise Persian cue at the point of change, and provide a limited, reversible transition or an equivalent familiar route when the change is substantial.
- Familiarity does not override correctness: do not preserve a legacy pattern when it conflicts with document lifecycle safeguards, permissions, accessibility, data integrity, or an explicit business requirement.

## Product Changelog Discipline

- Treat Changelog / What's New as a user-facing release surface, not as a mirror of Git history.
- Do not create a Changelog entry for every commit, one-line code change, formatting-only change, refactor, test-only change, dependency update, or internal cleanup.
- Add or update a release entry only when a coherent, user-visible milestone is complete: a new workflow, a meaningful page/report/dashboard capability, an important bug fix that changes user behavior, a security or data-integrity change, or a deployment/release milestone.
- Aggregate related small commits into one concise release note. Describe the user impact, affected area, and any action users need to take; keep commit IDs as optional technical metadata, never as the headline.
- Keep work-in-progress changes out of the published Changelog until they form a coherent release. Use a draft when the product's Changelog workflow supports drafts.
- For every Accounts/Hesabyar change, explicitly decide whether it is release-worthy before writing a Changelog entry. A source change alone is not sufficient, and a release entry must not be presented as live until the corresponding UI/backend change is deployed and verified.

## Operational UX Laws

Apply the following Laws of UX as operational safeguards. They guide hierarchy and interaction, but never weaken accounting controls, permissions, validation, or auditability.

- **Reduce cognitive load, choice overload, and Hick's Law:** make the common decision path visible first; group related filters and actions; move optional or infrequent controls behind progressive disclosure; use search, defaults, and narrowing controls for large option sets. Do not present a long, unprioritized action menu or filter wall.
- **Chunking, working memory, and Gestalt grouping:** group information that belongs together by proximity, clear headings, and restrained shared containers. Keep the current filters, selections, totals, status, and next action visible or carried forward so users recognize context rather than recall it from a previous screen.
- **Doherty Threshold:** acknowledge a user action immediately. For work that cannot complete quickly, show an honest Persian pending/running/success/failure state, meaningful progress when it is available, and an actionable result or error in the same workflow. Never use a success toast as a substitute for knowing whether a financial or inventory operation completed.
- **Fitts's Law:** make primary controls, table-row actions, and touch targets large enough and sufficiently separated to select reliably. Keep the action used with a field or selected rows near that context; do not rely on tiny icon-only controls for a critical or destructive operation.
- **Tesler's Law and the Active User Paradox:** absorb mechanical complexity in defaults, sensible prefill, validation, and safe automation. Explain unavoidable business complexity at the moment it is needed with concise Persian labels, helper text, or tooltips; do not expect users to read a manual before they can proceed.
- **Goal-Gradient and Zeigarnik Effects:** for multi-step work, show the current stage, completed stages, remaining work, and the next safe action. Preserve recoverable drafts and relevant filters, selections, and partially completed work across refresh, navigation, and recoverable errors when the workflow permits it.
- **Selective Attention, Von Restorff, and Serial Position Effects:** reserve visual emphasis for the primary action, important status, exceptions, and irreversible consequences. Do not make many elements compete for attention; use semantic color together with a Persian label or icon, never color alone.
- **Postel's Law:** accept reasonable user input variations where domain rules allow, normalize them before submission, and return precise Persian validation feedback. Be strict at the boundary for dates, amounts, permissions, lifecycle transitions, and stock/accounting integrity.
- **Peak-End and Aesthetic-Usability Effects:** use the established design system for a calm, polished finish, especially after submission, export, reconciliation, or error recovery. A visually polished surface must still expose real errors, confirmations, and next actions.

## Implementation Checks

1. Inspect the closest module route, page, components, and relevant documentation; then find the closest page in [the UI catalog](references/hesabyar-ui-catalog.md), including its Design System section, before writing new markup.
2. Keep the list, filters, detail surface, and mutations in their established ownership boundaries.
3. Match the selected pattern on desktop and mobile. Ensure long Persian labels do not overlap and tables stay horizontally scrollable when needed.
4. Add focused tests that assert the selected canonical component and the key user interaction for any new workflow.
5. Do not replace a working shared component with a hand-built equivalent unless the shared component cannot meet the required behavior.
6. For document actions, verify all three lifecycle states: draft has save/submit/delete, submitted has cancel but no delete, and cancelled has delete. Verify duplication creates a new draft and destructive actions require a confirmation.
7. For a process document, verify desktop layout has no narrow `max-w-*` cap, the module tone is supplied, workflow stages remain reachable, actions are supplied through the shared header, and printing uses the persisted document's Doctype and name.
8. For a changed or new interaction, compare it with the closest established Hesabyar workflow. Verify that familiar controls and task paths remain intact, or document the operational reason for the change and the Persian transition cue or alternate route for recurring users.
9. For a dense or asynchronous workflow, verify: common controls are prioritized and advanced controls are progressively disclosed; related information is visibly grouped; loading, progress, success, and failure states are explicit; critical targets work reliably on touch; and recoverable in-progress work retains its context.

## Efficient Component Discovery

Use the packaged component catalog before broad source exploration:

1. Run `scripts/find-ui-component.sh <name-or-keyword>` from this skill directory first. It searches the compact component index and returns the component name, source path, category, and matching guide entry.
2. Read only the returned entry in `references/component-guide.md` to understand the canonical usage and ownership boundary.
3. Inspect only the chosen source component when its API, slots, props, or emitted events are still unknown. Do not scan unrelated components merely to discover a substitute.
4. If the lookup has no catalog match, run `scripts/scan-ui-context.sh <domain> <frontend-src-path>` to obtain a compact domain map, then inspect the closest matching page or component. Use this fallback only when the catalog does not identify a component.
