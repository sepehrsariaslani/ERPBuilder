# Design tokens and layers

`frontend/src/design-system/tokens.js` owns semantic light/dark color, typography, spacing, radius, shadow, z-index, density, motion, RTL, and module accents. `themeContract.js`/`themeRuntime.js` apply theme and density. Reuse these before defining values. The existing spacing scale already includes 4/8/12/16/24/32/48 px; do not create a second scale.

Conceptual layers map to current governance: foundations → tokens; primitives → design/shared controls; ERP components → document/table/dashboard/domain compositions; patterns → Showcase catalog; shells → existing `DocumentPageShell`, `PartyDetailShell`, `DashboardShell`, list/report/settings patterns. This supplements, rather than renames, governance's tokens/atoms/molecules/templates/feature layers. Introduce a new canonical component or shell only after checking catalog, inventory, ownership, usage, and preview contract. Never create a named component solely to complete a checklist.

Apply **Susan Kare's symbolic-clarity lens** to icon tokens and components: one concept should keep one recognizable symbol; weight/size/stroke behavior should match adjacent typography; ambiguous critical actions need Persian labels or tooltips; semantic state must never rely on icon/color alone.

Apply **Esslinger's design-language lens** to system identity: module accents, typography, spacing, radius, imagery, and motion should produce one recognizable product family. Sales, Finance, HR, Manufacturing, and Procurement may have restrained semantic accents, but must not become separate visual systems.

Apply **Ive/Rams restraint**: do not add a token because one page wants a fashionable effect. New radius, shadow, blur, glass, gradient, or animation tokens require a repeatable semantic role. Prefer refinement of an existing token over expanding the vocabulary without need.

Keep icon family, stroke weight, icon size, elevation, and interactive states coherent across light/dark themes. Use the established Persian type family and roles; tabular figures can improve alignment in money, quantity, and timer columns without changing the brand font. Test semantic foreground/background pairs in both themes. Do not import a generated palette, font pairing, rounded-card style, glass effect, or new `design-system/MASTER.md` as a competing source of truth.
