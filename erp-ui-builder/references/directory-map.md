# Hesabyar UI directory map

Use this map before searching by filename. Paths are relative to the accounts app root; a component's index category is the first directory beneath `frontend/src/components` (`root` means a legacy top-level component).

| Area | Primary path | Use it for |
| --- | --- | --- |
| Pages | `frontend/src/pages/` | Route-level screens and page composition. |
| Domain components | `frontend/src/components/<domain>/` | Cohesive finance, sales, procurement, manufacturing, HR, inventory, party, supplier, and access UI. |
| Shared | `frontend/src/components/shared/` | Cross-domain controls, list views, filters, inputs, and reusable tables. |
| Design | `frontend/src/components/design/` | Design-system primitives: headers, buttons, feedback, and overlays. |
| Document | `frontend/src/components/document/` | Document shells, lifecycle surfaces, editable lines, tabs, breadcrumbs, and process headers. |
| Table | `frontend/src/components/table/` | Focused table implementations. Prefer shared `SmartDataTable` for analytical results. |
| Dashboard | `frontend/src/components/dashboard/` | Dashboard shell, widgets, metrics, and renderers. |
| Services | `frontend/src/services/` | API clients and data access; do not place service calls in presentation components. |
| Design system | `frontend/src/components/design/` | Tokens and canonical UI primitives; reuse before adding local equivalents. |
| UX core | `frontend/src/components/ux-core/` | Progressive disclosure, workspace, inbox, timeline, and command interactions. |

Other indexed directories retain their source-folder category (for example `activity`, `bulk`, `form`, `list-view`, `notes`, and `tasks`). Nested folders keep the category of their first directory: `components/procurement/foundation/...` remains `procurement`.
