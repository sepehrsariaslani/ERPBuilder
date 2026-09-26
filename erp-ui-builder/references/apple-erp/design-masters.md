# Design masters: operational synthesis for Hesabyar

This reference turns influential design work into **ERP decision rules**. It is not a hall of fame, a visual-style mood board, or permission to imitate Apple chrome. Use the people below as lenses for product decisions, then resolve conflicts with Hesabyar's real business rules, accessibility, permissions, auditability, and established component contracts.

## Attribution discipline

- Treat every named principle below as an **operational synthesis**, not a literal quotation, unless a source is explicitly quoted elsewhere.
- Do not justify a UI choice with "Jobs would do this" or "Apple does this." State the user problem, the local rule, and the measurable effect.
- Do not copy physical-product minimalism into ERP when it would hide audit evidence, lifecycle state, permissions, amounts, provenance, or recovery.
- If a designer's historical preference conflicts with tested user behavior, accessibility, or accounting integrity, the product evidence wins.

## Steve Jobs — essence, focus, end-to-end behavior

Use this lens when deciding what a page is fundamentally for.

- Start from the **user outcome**, not the database schema or available fields.
- Design the complete behavior from entry to completion; appearance is only one layer.
- Say no to duplicate routes, duplicate actions, and features that dilute the primary job.
- Simplify the product by removing conceptual branches, not by merely hiding controls.
- Design and engineering must meet: a beautiful surface over a confusing workflow is unfinished design.
- The main page story should be explainable in one sentence.

**ERP checks**
- Can the page job be stated without using a DocType name?
- Is there one primary decision/action for the current state?
- Are there multiple ways to do the same common task for no business reason?
- Did visual simplification accidentally hide status, consequences, or required evidence?
- Does the backend behavior support the promise made by the interface?

## Jony Ive — deep simplicity, coherence, care

Use this lens when a page feels busy, generic, inconsistent, or cosmetically minimal.

- Simplicity comes from understanding the system deeply enough to remove unnecessary structure.
- Do not confuse **minimal** with **simple**; sometimes more context makes the decision easier.
- Make related parts feel inevitable together: spacing, type, motion, states, and component behavior should share one logic.
- Remove details only after understanding what function they serve.
- Craft includes empty, loading, disabled, error, responsive, and edge states—not only the ideal screenshot.
- Small inconsistencies signal lack of care and reduce trust in financial software.

**ERP checks**
- Is complexity absorbed into defaults, automation, grouping, and progressive disclosure?
- Are there one-off paddings, colors, cards, or states that should come from shared tokens/components?
- Does every state feel like the same product?
- Has the team polished the failure and recovery path as carefully as the happy path?

## Bill Atkinson — direct manipulation and visible feedback

Use this lens for tables, editors, canvas-like workflows, selection, drag/drop, and frequent actions.

Atkinson's Lisa/Mac work helped make graphical operations visible and direct. Translate that spirit into web ERP without inventing fragile gestures.

- Prefer acting on the visible object over opening unnecessary configuration layers.
- Make selection, focus, drag target, insertion point, and result visible.
- Keep frequent operations close to the object they affect.
- Give immediate feedback for direct manipulation.
- A direct action still needs keyboard, touch, permission, validation, and recovery paths.
- User testing beats designer intuition when a novel interaction is introduced.

**ERP checks**
- Can a row, task, line item, or schedule block be edited or inspected directly when safe?
- Is the target and resulting state obvious before and after the action?
- If drag/drop exists, is there a non-drag alternative?
- Can a mistaken manipulation be cancelled or reversed safely?

## Susan Kare — symbolic clarity with restrained personality

Use this lens for icons, statuses, empty states, illustrations, and micro-identity.

Kare's Macintosh work showed that tiny graphical elements can be understandable, memorable, and humane.

- Icons communicate first and decorate second.
- Prefer recognizable, concrete metaphors over clever but ambiguous symbols.
- Keep icon family, weight, size, stroke/fill behavior, and semantic meaning consistent.
- Do not make critical actions icon-only when the meaning is not universal.
- Personality can live in a few well-crafted details without turning operational software into decoration.
- Pixel-level legibility matters at actual use size, not only in a design canvas.

**ERP checks**
- Would a new user understand the icon without memorizing the product?
- Is the same concept represented by the same symbol everywhere?
- Does status always include text/accessible meaning, not only an icon or color?
- Are decorative icons competing with operational data?

## Jef Raskin — humane cognition, attention, modes, habituation

Use this lens when a workflow forces users to remember hidden state or repeatedly interrupts them.

Raskin argued that interfaces should fit human cognition instead of exposing machine structure.

- Keep the user's **task** as the locus of attention; the interface should not demand attention without a proportional reason.
- Minimize hidden modes. When modes are unavoidable, make them persistent and unmistakable.
- Preserve behavioral consistency so practiced actions can become reliable habits.
- Avoid routine confirmations that users will click through automatically.
- Do not require users to remember values, state, or context that the system can keep visible.
- Do not expose storage, implementation, or backend concepts merely because they exist.

**ERP checks**
- Does the same action mean different things in different invisible states?
- Are Draft / Submitted / Cancelled / locked / read-only modes visible before interaction?
- Does a confirmation interrupt a routine reversible action?
- Are users forced to remember prior filters, selections, totals, or document context?
- Does an ERP concept exist on screen because the user needs it or because the backend has it?

## Larry Tesler — modelessness, conventions, user testing

Use this lens for editing behavior, action semantics, and cross-screen consistency.

Tesler advocated reducing modes and helped establish interaction conventions that became learnable because they were reused.

- The same familiar action should produce the same kind of result across the product.
- Prefer standard editing behavior over local inventions.
- Reduce mode errors; if a mode is necessary, expose it clearly and constrain dangerous actions.
- Build conventions that transfer from one page to another.
- Validate interaction assumptions with users, especially when changing a frequent workflow.

**ERP checks**
- Does Save, Edit, Cancel, Duplicate, Delete, Filter, or row selection behave consistently everywhere?
- Can a user accidentally act in the wrong document mode?
- Did a redesign move or rename a habitual operation without operational benefit?
- Are shortcuts accelerators for experts rather than requirements for novices?

## Don Norman — whole experience, conceptual models, signifiers, feedback, recovery

Use this lens when users do not understand what is possible, what happened, or why.

Norman's work emphasizes the gap between the system's internal model and the user's mental model, and the importance of visible signifiers and feedback.

- Match the interface's conceptual model to the user's business model.
- Make available actions perceivable; do not rely on invisible affordances.
- Give timely feedback after meaningful actions.
- Use constraints to prevent invalid operations before error messages are needed.
- Treat errors as a design condition: explain what happened and provide recovery.
- Evaluate the whole experience before, during, and after the screen—not a screenshot in isolation.
- Names should come from what users recognize and control, not internal implementation.

**ERP checks**
- Does the page speak accounting, inventory, sales, HR, or manufacturing language rather than developer language?
- Is a disabled action explained when the reason matters?
- Does the system show what changed after an operation?
- Can the user recover from slips without losing entered work?
- Does the visual model reflect the true business lifecycle?

## Bruce Tognazzini — discoverability, stability, visibility, efficiency

Use this lens for high-frequency operational workflows.

Tognazzini's interaction principles emphasize discoverable, stable, visible interfaces; protecting user work; reducing latency; and optimizing for the user's efficiency.

- Keep frequent targets stable so learned movement remains useful.
- Make important state and available actions visible.
- Protect user-entered work across recoverable failure.
- Spend computation to save human effort when correctness permits it.
- Acknowledge actions immediately; do not leave the user wondering whether the system received input.
- Optimize the repeated workflow, not only the first-use tutorial.
- Keep targets large and close enough for reliable mouse/touch use.

**ERP checks**
- Do buttons jump position after loading or status changes?
- Is work lost on timeout, validation failure, or navigation?
- Can frequent operators use keyboard/bulk actions without hurting novice discoverability?
- Does latency have honest pending/progress feedback?
- Is the page asking the user to do mechanical work the system can safely do?

## Dieter Rams — useful, understandable, honest, unobtrusive, less but better

Rams did not work for Apple, but his product-design principles are a useful restraint lens and strongly overlap with the design culture Apple later popularized.

- Design must serve use before self-expression.
- Make the product understandable without ornamental explanation.
- Be honest: do not exaggerate precision, importance, certainty, or capability.
- Prefer durable patterns over fashionable effects.
- Be thorough down to details.
- Remove nonessential design until what remains is useful and clear.
- "Less" is valuable only when it produces **better**, not when it hides necessary function.

**ERP checks**
- Is a card, border, gradient, badge, animation, or chart carrying information?
- Does a KPI imply certainty or causality the data does not support?
- Will this interaction still make sense after the current visual trend passes?
- Can one visual accessory be removed without losing meaning?

## Hartmut Esslinger / frog — coherent design language and emotion

Use this lens when modules feel like unrelated applications.

Esslinger and frog's Apple-era work showed the value of a coherent design language across a product family while preserving character.

- Build a recognizable system language across modules.
- Differentiate through a small set of deliberate signatures, not incompatible controls.
- Let form carry emotion, but never at the expense of function.
- A design language should make new surfaces easier to create consistently.
- Product identity can come from tone, typography, module accent, imagery, and a few defining interactions.

**ERP checks**
- Do Sales, Finance, HR, Manufacturing, and Procurement feel like one product?
- Are module accents semantic and restrained rather than separate mini-brands?
- Could a new page be assembled from existing system language without inventing a new visual grammar?

## Alan Dye-era Apple software design — context, adaptation, cross-platform coherence

Use this lens for responsive behavior and contextual controls. This is about the software-design direction associated with Apple's Human Interface Design work, not about copying Liquid Glass.

- Controls should support the content and adapt to context.
- Shared interaction language should remain coherent across form factors.
- Visual material is only justified when it improves hierarchy, focus, or spatial understanding.
- Responsive design should adapt composition, not merely scale dimensions.
- Hardware/software integration translates here to **data/workflow/UI integration**: the visual state must track the real system state.

**ERP checks**
- Does compact/mobile mode reprioritize work rather than shrink desktop?
- Do contextual actions appear where the related data is being used?
- Is any blur/glass/effect improving hierarchy, or merely imitating a platform?
- Does displayed state update from authoritative backend state?

## Edward Tufte — evidence, comparison, data integrity

Tufte is not an Apple designer, but his information-design work is highly relevant to ERP reports, dashboards, and analytical tables.

- Above all, show the data and the comparison the decision requires.
- Remove non-data decoration that competes with evidence.
- Preserve graphical integrity: visual magnitude must not misrepresent numerical magnitude.
- Prefer direct labels and nearby context over distant legends when practical.
- Show units, baseline, denominator, time range, filters, and provenance.
- Dense information can be good when it increases useful comparison without becoming clutter.
- Use small multiples or aligned tables when comparison is more important than spectacle.
- A chart is not automatically better than a table; exact reconciliation often belongs in a table.

**ERP checks**
- Can the reader verify exact values?
- Is a truncated axis exaggerating a change?
- Are two visually comparable series actually using different scales?
- Is the denominator/time period clear?
- Can the user drill from summary evidence to authoritative records?

## Jakob Nielsen and Rolf Molich — reusable usability heuristics

Hesabyar already operationalizes these ideas in its familiar-pattern and UX-law sections. Keep them as a verification layer:

- visibility of system status
- match with the real world
- user control and freedom
- consistency and standards
- error prevention
- recognition rather than recall
- flexibility and efficiency
- aesthetic/minimal design without irrelevant information
- error recognition/diagnosis/recovery
- contextual help when needed

Do not duplicate these as a competing checklist; use them to catch gaps after applying the ERP-specific rules.

## Synthesis: which lens to use

| Design question | Primary lenses |
| --- | --- |
| What is this page actually for? | Jobs, Apple Purpose |
| How do we reduce complexity without hiding truth? | Ive, Rams, Raskin |
| How should frequent actions behave? | Atkinson, Tesler, Tognazzini |
| Why does the user not understand the state? | Norman, Raskin, Nielsen |
| Are icons/statuses clear? | Kare, Norman |
| Do modules feel like one product? | Esslinger, Ive |
| Is mobile/responsive behavior intentional? | Apple Flexibility, Dye-era software design |
| Is a dashboard/chart honest and useful? | Tufte, Rams |
| Does the product feel finished? | Ive, Kare, Apple Craft |
| Is there too much visual noise? | Rams, Tufte, Ive |
| Are users losing work or context? | Tognazzini, Norman, Raskin |
| Are we changing a familiar pattern? | Tesler, Raskin, Nielsen |

## Mandatory master-review pass

For a significant new page, redesign, or shared component, ask these in order:

1. **Jobs / Purpose:** What is the single business outcome?
2. **Ive / Deep simplicity:** Which complexity can the system absorb safely?
3. **Raskin / Attention:** What forces the user to remember or monitor hidden state?
4. **Norman / Model:** Does the UI match how the user understands the business?
5. **Atkinson + Tesler / Interaction:** Can the common action be more direct and consistent?
6. **Tognazzini / Efficiency:** Is the frequent workflow stable, fast, and work-preserving?
7. **Kare / Symbols:** Are visual symbols legible, consistent, and non-ambiguous?
8. **Rams / Restraint:** What can be removed without reducing truth or capability?
9. **Esslinger / System language:** Does this belong visually and behaviorally to Hesabyar?
10. **Tufte / Evidence:** If data drives the decision, is the evidence honest and comparable?
11. **Apple Craft + Delight:** Are all states polished, and does fluency—not decoration—create delight?

## Non-negotiable ERP override

These master lenses never override:
1. accounting/stock/business correctness,
2. permissions and auditability,
3. accessibility and recoverability,
4. native Frappe/ERPNext lifecycle semantics,
5. established Hesabyar canonical components and page contracts.

When visual purity conflicts with operational truth, **operational truth wins**.

## Source map

Use these for provenance when a review needs historical or external support:

- Apple Human Interface Guidelines / WWDC26 design principles: https://developer.apple.com/design/human-interface-guidelines/ and https://developer.apple.com/videos/play/wwdc2026/250/
- Steve Jobs / Jony Ive simplicity discussion: https://www.smithsonianmag.com/arts-culture/how-steve-jobs-love-of-simplicity-fueled-a-design-revolution-23868877/
- Apple's design-process framing from Jony Ive: https://www.apple.com/newsroom/2016/11/designed-by-apple-in-california-chronicles-20-years-of-apple-design/
- Bill Atkinson profile: https://computerhistory.org/profile/bill-atkinson/
- Susan Kare profile: https://computerhistory.org/profile/susan-kare/
- Macintosh origins / Jef Raskin context: https://computerhistory.org/exhibits/hello-the-mac-at-40/
- Larry Tesler and Chris Espinosa on origins of the Apple human interface: https://archive.computerhistory.org/resources/access/text/2014/10/102739956-05-01-acc.pdf
- Don Norman on Apple's User Experience Architect role: https://jnd.org/where-did-the-term-user-experience-ux-come-from/
- Bruce Tognazzini's interaction-design principles: https://www.asktog.com/basics/firstPrinciples.html
- Dieter Rams' ten principles: https://www.vitsoe.com/us/about/good-design
- frog / Hartmut Esslinger Apple-era history: https://www.frog.co/culture
- Apple software-design context associated with Alan Dye's HI leadership: https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/
- Jakob Nielsen's usability heuristics: https://www.nngroup.com/articles/ten-usability-heuristics/
- Edward Tufte: *The Visual Display of Quantitative Information*, *Envisioning Information*, and *Visual Explanations*.
