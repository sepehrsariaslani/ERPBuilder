# Forms

Use canonical labeled controls, `PersianDateInput`, and permission-aware `SearchableDropdown`. Prefer selecting known entities over retyping identifiers. Group fields by the decision they support; show required/optional state, dependent fields, and advanced fields when relevant. Preserve values when sections expand or validation fails.

Validate near the field as the user proceeds, but do not interrupt typing with premature errors. Explain what failed and how to correct it. Keep unsaved state and a safe leave path. Long forms should show stage/progress and allow back without losing work. A quick-create panel is for a short focused task; the native full form handles child tables, attachments, and complex lifecycle.

Use semantic input types and supported autocomplete for predictable entry. Differentiate read-only values from disabled controls. On submit, move focus to the first invalid field; when several errors exist, provide a short summary with links to their fields as well as local messages. Announce validation and completion accessibly without stealing focus for routine toasts. Preserve draft values on recoverable server or network errors; use autosave only when the backend and document lifecycle make it safe and truthful.
