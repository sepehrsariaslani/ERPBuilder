# Accessibility

Check keyboard order and operation, visible focus, programmatic names and status announcements, contrast in both themes, text enlargement, target size/spacing, responsive reflow, and reduced motion. Use `ux-core/accessibility.js`, semantic tokens, and canonical controls before local fixes. Color, icon, shape, or motion must never be the sole carrier of status.

Measure contrast from actual rendered color values; for WCAG AA use at least 4.5:1 for normal text and 3:1 for large text and essential graphical controls. Test the supported viewport and text-scale range; do not import Apple's native point sizes as CSS pixel requirements. A screenshot alone cannot verify keyboard or screen-reader behavior. Treat an unusable flow or data-loss risk as Critical in review.
