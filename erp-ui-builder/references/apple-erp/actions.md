# Actions

Give each context one visually dominant primary action. Keep secondary and rare actions in `DocumentActionDrawer`, menu, or contextual controls, while required lifecycle actions remain visible as specified in `SKILL.md`. Label actions with the actual result, consistently across button, confirmation, pending state, and success state.

Show an action only when meaningful and permitted. For a reversible action, prefer a real Undo backed by the domain lifecycle. For irreversible deletion/cancellation or sensitive effects, state the object and consequence, show Cancel, and require deliberate confirmation. Do not imply Undo when the backend cannot safely reverse the operation. Keep controls near their data and targets reliably selectable.
