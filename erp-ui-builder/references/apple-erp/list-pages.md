# List pages

Use `GenericListView` or its module wrapper. Give search, common filters, active filters, result count, selection, and bulk action a predictable location. Show the status and fields needed for the next decision; disclose rare columns and filters through the existing view controls. Preserve sorting, saved views, selection, and row-click destination.

Use one prominent collection action per context. A bulk action appears only after selection and states its scope and consequence. Empty results distinguish no records from no filter matches, with a clear next action. On mobile, keep a usable search/filter path and a deliberate record summary rather than shrinking the desktop grid.

Keep list URLs or saved views shareable when the existing route model supports it. Returning from a record should restore the user's query, filters, selection, and scroll position where safe. For very large result sets, use the list's existing pagination or virtualization contract based on measured latency and memory; a fixed row-count rule alone is insufficient.
