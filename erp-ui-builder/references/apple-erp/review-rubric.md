# Design review rubric

First identify page kind, audience, primary job, business state, closest existing pattern, and evidence available (source, screenshot, authenticated runtime). Read `principles.md`, `information-hierarchy.md`, and only topic references relevant to the screen. Inspect the entire flow from entry through completion and recovery.

For each finding report **What** (specific observed problem), **Why** (the exact local rule/principle and user effect), **Fix** (a concrete change using existing Vue component/owner), and severity. Cite a local reference heading or the opened authoritative source; label judgment as judgment. Include measurable values where available. Do not present untested behavior as observed.

- **Critical:** inaccessible or unusable layout, confusing interaction that prevents work, or data-loss/integrity risk.
- **High:** major friction, weak hierarchy, unclear workflow, or serious product-pattern inconsistency.
- **Medium:** avoidable complexity, inconsistent behavior, or missed canonical pattern.
- **Low:** polish and edge cases.

Keep the review proportional. Name what works and should remain. Resolve conflicts in this order: business correctness and permissions, accessibility and recoverability, familiar product patterns, then visual craft. Do not mistake visual minimalism for a successful ERP workflow.
