# Tables

Use `SmartDataTable` for read-heavy reports and `EditableTable`/`DocumentEditableTable` for editable rows. Preserve numeric precision, units, Persian formatting, alignment, totals, sorting, frozen context, and drill-down. Accounting and operational tables may be compact when scanability and targets remain usable.

Keep column meaning visible. Explain non-obvious signs, deltas, and source provenance next to the result. Do not encode status only through color. Inline editing is useful when validation, save state, cancellation, and error recovery remain clear. On narrow screens, scroll with key identity pinned or provide a task-focused row summary; do not silently drop important columns.

For sortable headers, expose the current sort direction semantically, such as `aria-sort`, and make sorting keyboard operable. Right-align or use the existing numeric alignment convention consistently; tabular figures help compare amounts and quantities. Keep units, currency, posting date, and totals attached to the values they qualify. Virtualize or paginate large tables only after checking sticky columns, keyboard navigation, screen-reader order, exports, and row selection still work.
