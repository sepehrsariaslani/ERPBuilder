# Status and feedback

Use `AppStatusBadge`, `StatePanel`, `Skeleton`, `Toast`, and native lifecycle state where appropriate. Every mutation should move through honest pending, saved/completed, failed/retry, or blocked states. A toast cannot prove that an accounting or stock mutation completed; confirm from the returned authoritative state.

Apply **Norman's feedback lens**: after a meaningful action, show what changed and what the system now believes to be true. Feedback belongs near the affected work when possible. A control should not look complete while the backend state is still unknown.

Apply **Raskin's mode lens**: modes that affect meaning—Draft/Submitted/Cancelled, read-only, offline, bulk selection, reconciliation lock, approval lock—must be persistently visible rather than remembered. Avoid transient mode indicators that disappear while their consequences remain.

Apply **Tognazzini's stability/latency lens**: acknowledge input promptly, protect user work, and reserve space for asynchronous content so status changes do not move targets unexpectedly. For longer work, show honest progress when known and keep the rest of the task usable when safe.

Human status names should explain a block and the next permitted action. Loading feedback appears promptly, with progress when known and ongoing work available when possible. Use an interrupting alert only for a decision that truly requires interruption. Empty states distinguish no data, no matches, and unavailable data. Never use color alone.

Distinguish offline, timeout, permission failure, validation failure, and a legitimate empty result when the backend can provide that distinction. A retry must not silently repeat a non-idempotent financial mutation. Routine toasts should announce politely and never trap or steal focus.
