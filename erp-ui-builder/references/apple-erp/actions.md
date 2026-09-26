# Actions

Give each context one visually dominant primary action. Keep secondary and rare actions in `DocumentActionDrawer`, menu, or contextual controls, while required lifecycle actions remain visible as specified in `SKILL.md`. Label actions with the actual result, consistently across button, confirmation, pending state, and success state.

Apply **Atkinson's direct-manipulation lens**: when safe, let users act on the visible row, line item, task, schedule block, or record instead of navigating through an unnecessary configuration layer. Selection, target, pending state, and result must remain visible. Drag/drop and inline edit require a keyboard/touch alternative, validation, and recovery.

Apply **Tesler/Raskin modelessness**: the same familiar action should not silently change meaning because of an invisible mode. If document lifecycle, bulk-select mode, edit/view state, or permissions alter action semantics, make the state obvious before the user acts. Preserve consistent Save/Edit/Cancel/Delete/Duplicate behavior across modules.

Apply **Norman/Tognazzini feedback and efficiency**: available actions must look available, disabled states should be explainable when relevant, frequent targets should stay in stable locations, and input acknowledgement should be immediate. Do not move the primary action after loading if that creates a moving target.

Show an action only when meaningful and permitted. For a reversible action, prefer a real Undo backed by the domain lifecycle. For irreversible deletion/cancellation or sensitive effects, state the object and consequence, show Cancel, and require deliberate confirmation. Do not imply Undo when the backend cannot safely reverse the operation. Avoid routine confirmations that frequent users will click through automatically.

Use semantic buttons and explicit disabled/busy states; a control that looks actionable must respond. Keep pointer and pressed feedback visible without moving surrounding content. Do not rely on hover to reveal the only path to a critical action. Prevent duplicate submissions while an action is pending, but keep the pending state and cancellation or recovery path understandable.
