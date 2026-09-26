# Charts and data

Choose a chart for the question: line for change over time, bar for comparison/ranking, a restrained part-to-whole view for a few categories, and a table when exact values or reconciliation matter most. Show time granularity, units, denominator/baseline, company/filter context, and source freshness. Never imply an estimate is an approved accounting result.

Apply the **Tufte evidence lens**:

- Above all, show the data and the comparison the decision requires.
- Remove chart chrome, decoration, gradients, 3D perspective, and redundant encodings that compete with evidence.
- Preserve graphical integrity: visual magnitude must not exaggerate numerical magnitude.
- Use a common scale for visual comparisons unless the difference is clearly labeled and justified.
- Bar charts normally need a zero baseline; line charts may use a non-zero domain when analytically appropriate, but the truncation must be obvious.
- Prefer direct labels and nearby annotations over distant legends when that improves scanning.
- Dense small multiples or aligned rows can be better than one oversized dashboard chart when users compare many entities.
- Keep exact values reachable through labels, table, tooltip, drill-down, or export.
- Do not use a chart when a compact table communicates the decision more accurately.

Apply the **Rams honesty lens**: do not decorate weak data into apparent importance. Avoid fake precision, unexplained scores, dramatic color, or oversized KPI treatment when the business meaning is uncertain. A visual should be quieter than the evidence it supports.

Provide a nearby text insight and accessible table or equivalent exact-value route. Distinguish series with labels or patterns as well as color; keep labels, axis ticks, and values legible in both themes. Tooltips and drill-down must work with keyboard and touch, not hover alone. Show empty, loading, failure/retry, and true-zero states separately. Simplify ticks or change chart form on narrow screens without hiding important series or the route to records.

For large datasets, aggregate for the overview and preserve a drill-down/export path to authoritative rows. Reuse existing chart components, dashboard definitions, number/date formatters, and report tables before adding a visual library or a local chart implementation.
