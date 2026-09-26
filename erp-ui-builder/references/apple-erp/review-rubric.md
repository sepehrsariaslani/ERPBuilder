# Design review rubric

First identify page kind, audience, primary job, business state, closest existing pattern, and evidence available (source, screenshot, authenticated runtime). Read `principles.md`, `information-hierarchy.md`, and only topic references relevant to the screen. For a significant new page, redesign, or shared component, also read `design-masters.md`. Inspect the entire flow from entry through completion and recovery.

For each finding report **What** (specific observed problem), **Why** (the exact local rule/principle and user effect), **Fix** (a concrete change using existing Vue component/owner), and severity. Cite a local reference heading or the opened authoritative source; label judgment as judgment. Include measurable values where available. Do not present untested behavior as observed.

- **Critical:** inaccessible or unusable layout, confusing interaction that prevents work, or data-loss/integrity risk.
- **High:** major friction, weak hierarchy, unclear workflow, or serious product-pattern inconsistency.
- **Medium:** avoidable complexity, inconsistent behavior, or missed canonical pattern.
- **Low:** polish and edge cases.

## Master-lens pass

Do this pass before visual polish:

1. **Purpose / Jobs:** can the screen's business outcome be stated in one sentence?
2. **Deep simplicity / Ive + Rams:** is complexity actually removed/absorbed, or merely hidden?
3. **Attention / Raskin:** does the UI force memory, mode awareness, or unnecessary interruption?
4. **Mental model / Norman:** does the visible model match the user's business model?
5. **Directness / Atkinson + Tesler:** are frequent actions direct, consistent, and recoverable?
6. **Efficiency / Tognazzini:** are frequent targets stable, feedback prompt, and work protected?
7. **Symbol clarity / Kare:** are icons/statuses legible and non-ambiguous?
8. **System language / Esslinger:** does the surface belong to the same Hesabyar product family?
9. **Evidence / Tufte:** when data drives a decision, is comparison honest and exact values reachable?
10. **Craft / Apple:** are loading, empty, error, responsive, focus, keyboard, and recovery states finished?

A finding should still be written as a local What / Why / Fix issue; designer names are lenses, not severity evidence.

Keep the review proportional. Name what works and should remain. Resolve conflicts in this order: business correctness and permissions, accessibility and recoverability, familiar product patterns, task efficiency, then visual craft. Do not mistake visual minimalism for a successful ERP workflow.

For data-heavy or touch workflows, also check keyboard/hover parity, real target size, stable loading layout, read-only versus disabled state, sortable-table semantics, and an accessible path to chart values. Check the compact and wide layouts in both themes when those surfaces are affected. Measure performance or contrast before reporting a numeric failure; generic thresholds from an external style guide are prompts to investigate, not proof that Hesabyar fails.
