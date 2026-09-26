# Performance as design quality

Keep the first useful context and primary action available promptly. Reserve stable space for tables, charts, images, and asynchronous summaries; a loading state should describe the pending work rather than flash an empty result. Split heavy pages by route or feature when measured initial load warrants it, and load below-the-fold media only when it does not hide an operational action.

For large lists, prefer the existing pagination or virtualization mechanism after measuring scroll, selection, keyboard, sticky-column, and export behavior. Debounce expensive search or resize work when needed, while keeping typing and action feedback immediate. Avoid layout thrash and decorative effects that delay data entry or cause content to jump. Verify with runtime measurements when making performance claims; do not turn a generic row-count or millisecond suggestion into a hard ERP rule.
