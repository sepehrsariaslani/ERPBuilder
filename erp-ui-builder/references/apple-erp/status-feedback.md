# Status and feedback

Use `AppStatusBadge`, `StatePanel`, `Skeleton`, `Toast`, and native lifecycle state where appropriate. Every mutation should move through honest pending, saved/completed, failed/retry, or blocked states. A toast cannot prove that an accounting or stock mutation completed; confirm from the returned authoritative state.

Human status names should explain a block and the next permitted action. Loading feedback appears promptly, with progress when known and ongoing work available when possible. Use an interrupting alert only for a decision that truly requires interruption. Empty states distinguish no data, no matches, and unavailable data. Never use color alone.

Reserve space for asynchronous content so a result does not jump under the pointer or move the next action. Distinguish offline, timeout, permission failure, validation failure, and a legitimate empty result when the backend can provide that distinction. A retry must not silently repeat a non-idempotent financial mutation. Routine toasts should announce politely and never trap or steal focus.
