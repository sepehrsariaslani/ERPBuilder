# Design tokens and layers

`frontend/src/design-system/tokens.js` owns semantic light/dark color, typography, spacing, radius, shadow, z-index, density, motion, RTL, and module accents. `themeContract.js`/`themeRuntime.js` apply theme and density. Reuse these before defining values. The existing spacing scale already includes 4/8/12/16/24/32/48 px; do not create a second scale.

Conceptual layers map to current governance: foundations → tokens; primitives → design/shared controls; ERP components → document/table/dashboard/domain compositions; patterns → Showcase catalog; shells → existing `DocumentPageShell`, `PartyDetailShell`, `DashboardShell`, list/report/settings patterns. This supplements, rather than renames, governance's tokens/atoms/molecules/templates/feature layers. Introduce a new canonical component or shell only after checking catalog, inventory, ownership, usage, and preview contract. Never create a named component solely to complete a checklist.
