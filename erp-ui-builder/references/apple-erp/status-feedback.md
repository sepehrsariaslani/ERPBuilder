# Status and feedback

Use `AppStatusBadge`, `StatePanel`, `Skeleton`, `Toast`, and native lifecycle state where appropriate. Every mutation should move through honest pending, saved/completed, failed/retry, or blocked states. A toast cannot prove that an accounting or stock mutation completed; confirm from the returned authoritative state.

Human status names should explain a block and the next permitted action. Loading feedback appears promptly, with progress when known and ongoing work available when possible. Use an interrupting alert only for a decision that truly requires interruption. Empty states distinguish no data, no matches, and unavailable data. Never use color alone.
