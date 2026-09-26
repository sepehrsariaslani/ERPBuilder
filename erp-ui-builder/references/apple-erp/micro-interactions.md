# Micro-interactions

Micro-interactions should make ERP work feel immediate, stable, and polished. They are not decoration.

## Required qualities

A good micro-interaction:
- explains a state change;
- confirms input;
- preserves spatial continuity;
- helps the user predict the result;
- finishes quickly;
- remains understandable with reduced motion.

## High-value ERP moments

Polish these first:
- save / autosave / submit state;
- row selection and bulk-action activation;
- inline edit commit/cancel;
- dropdown search and selection;
- expand/collapse of advanced detail;
- opening a side panel from a row;
- Kanban/Gantt drag state and drop result;
- status transition;
- validation correction;
- filter application / clearing;
- completion of a longer-running process.

## Behavior

- Hover, focus, pressed, selected, busy, success, and error states must be visually related.
- Do not move surrounding content when a button becomes busy.
- Inline success should often replace a transient toast when the affected object is already visible.
- Highlight a changed row/value briefly only when it helps users locate the result.
- For direct manipulation, preview the target before commit and show the committed state after.
- Never animate frequent table/list entry in a way that slows scanning.
- Avoid chained/staggered entrance animation for operational screens.

## Timing and motion tokens

Use existing motion tokens. Do not introduce page-local easing/duration values for flair. Prefer opacity and transform when motion is needed. Keep interactions interruptible and non-blocking.

## Reduced motion

When motion is disabled:
- state differences remain fully visible;
- no information disappears;
- spatial relationships remain understandable through layout, labels, and focus.

The best micro-interaction is often a clear state change with excellent timing, not a visible animation.
