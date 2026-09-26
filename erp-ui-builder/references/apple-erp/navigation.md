# Navigation

Use the business mental model for routes and labels, while retaining existing route contracts: for example order → production → delivery → payment. This is the **Norman/Raskin** rule: navigation should reflect how users understand their work and should not expose storage or backend organization merely because it exists.

Always show current location and a predictable way back. Use breadcrumbs for document depth, tabs for stable peer sections, and contextual panels for drill-down. Tabs navigate; action controls perform mutations. A mode or context that changes what navigation means must be visible.

Apply **Tesler/Tognazzini stability**: frequent destinations and recurring actions should stay in predictable locations. Do not move a familiar command merely for visual novelty. Preserve orientation, filters, selection, and relevant scroll/context across nearby steps where safe so frequent operators can form reliable habits.

Keep search, Back, Save, Edit, Delete, Filter, and row navigation familiar. Mobile navigation must keep the same work reachable with fewer simultaneous controls, not simply hide the desktop path.

Keep a meaningful URL for a document, report, or filtered operational view when the route system supports it; browser Back should not unexpectedly reset the user's task. Identify the active location by text/weight/indicator as well as color. After route changes, move focus to the main content heading or equivalent region when needed for screen-reader orientation. Avoid stacking tabs, sidebars, and bottom navigation at the same hierarchy level.
