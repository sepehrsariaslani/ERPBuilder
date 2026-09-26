# Complexity management

The system should do mechanical work so users can make business decisions. Prefill known company, party, date, currency, warehouse, and permitted defaults from authoritative context; expose the source and allow correction when policy permits. Preserve the selected context across adjacent steps. Use progressive disclosure for rare controls, but keep blockers, exceptions, totals, price provenance, permission limits, and audit evidence easy to find.

Use **Ive-style deep simplicity**: remove complexity by understanding and absorbing it into safe defaults, derived values, grouping, automation, and reusable workflow structure. Never create the appearance of simplicity by hiding a business rule the user must understand.

Use **Raskin's cognition lens**: the task—not the interface—should remain the locus of attention. Minimize hidden modes and interruptions. If Draft/Submitted/Cancelled, edit/view, bulk-selection, reconciliation, or another mode changes what actions mean, make that mode persistently visible. Preserve filters, selections, draft values, and nearby context so users recognize rather than recall.

Use **Norman's conceptual-model lens**: expose the business model users understand, not implementation structure. Constraints should prevent invalid operations before a server error when the rule is already known locally, but the backend remains authoritative. Disabled controls should explain the relevant constraint when users need to know why.

Use **Tesler/Tognazzini efficiency**: spend system effort to reduce safe mechanical user effort. Stable defaults, prefill, bulk operations, keyboard acceleration, saved filters, and contextual actions can help frequent operators. Do not automate approval, posting, cancellation, publication, or other consequential decisions merely to reduce clicks.

Before adding a step, modal, choice, or confirmation, ask which risk it controls. Remove it when validation, inline explanation, safe defaults, or real Undo protects the same outcome with less work. Do not use routine confirmations that users will habituate to. Separate system work from human approval and show what is pending, what changed, and what needs the user's decision.

Review the entire flow with a first-time user and a frequent operator: entry → context → decision → commit → exception → recovery → completion. The first view should answer what happened, what matters, and what to do next; advanced information stays reachable without teaching DocType or database structure. Adjust density to the job: a calm overview, a compact accounting report, and a fast POS can share the same tokens and behavior without identical layouts.
