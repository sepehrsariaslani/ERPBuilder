# Motion

Use existing motion tokens to explain a state change, preserve spatial continuity, or confirm an action. Keep transitions brief and non-blocking, particularly in frequent table and POS interactions. Avoid decorative loops, surprise movement, and delays before operational controls become available.

Honor reduced-motion preferences with the existing token contract. The same state and next action must remain clear without animation. Performance, including interaction latency and layout stability, is part of design quality.

Prefer opacity/transform over layout-changing animation when they express the state clearly. Transitions must be interruptible and must not block input. Avoid staggered entrance effects on high-frequency lists, reports, and POS; users should be able to scan data as soon as it appears. Do not replace the product's current easing or duration tokens with a generic animation preset.
