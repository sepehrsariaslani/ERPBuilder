# ERP UI Builder Catalog Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish the complete ERP UI Builder skill with a low-token component discovery catalog and read-only lookup tool.

**Architecture:** Preserve the complete existing skill directory under `erp-ui-builder/`. Add a concise directory map, a human guide for canonical components, a machine-readable component index, and a shell lookup command that reads those files without inspecting Vue source. The skill points agents to the lookup command before broad repository search.

**Tech Stack:** Markdown, JSON, POSIX shell, Bash, GitHub.

## Global Constraints

- Copy the complete current skill without shortening its existing guidance.
- Keep all lookup operations read-only.
- Return concise Persian-facing guidance and repository-relative paths.
- The component index records every discovered `.vue` component; detailed usage is limited to canonical components.

---

### Task 1: Create a failing lookup-tool test

**Files:**
- Create: `tests/find-ui-component.test.sh`
- Create: `erp-ui-builder/scripts/find-ui-component.sh`

**Interfaces:**
- Produces: `find-ui-component.sh <query>`, printing matching component name, relative path, category, and optional guide reference.

- [ ] **Step 1: Write the failing test**

```bash
#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output="$($root/erp-ui-builder/scripts/find-ui-component.sh SmartDataTable)"
[[ "$output" == *"SmartDataTable"* ]]
[[ "$output" == *"frontend/src/components/shared/SmartDataTable.vue"* ]]
"$root/erp-ui-builder/scripts/find-ui-component.sh" nonexistent-component >/dev/null 2>&1 && exit 1 || true
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/find-ui-component.test.sh`

Expected: FAIL because `find-ui-component.sh` does not exist.

- [ ] **Step 3: Write the minimal implementation**

```bash
#!/usr/bin/env bash
set -euo pipefail
query="${1:-}"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
[[ -n "$query" ]] || { printf 'Usage: %s <component-or-keyword>\n' "$0" >&2; exit 2; }
matches="$(jq -r --arg query "$query" '
  .components[] | select((.name + " " + .path + " " + .category | ascii_downcase) | contains($query | ascii_downcase)) |
  "\(.name)\t\(.path)\t\(.category)\t\(.guide // \"\")"
' "$root/references/component-index.json")"
[[ -n "$matches" ]] || { printf 'No component found for: %s\n' "$query" >&2; exit 1; }
printf '%s\n' "$matches" | column -ts $'\t'
```

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/find-ui-component.test.sh`

Expected: PASS.

- [ ] **Step 5: Commit**

Run: `git add tests/find-ui-component.test.sh erp-ui-builder/scripts/find-ui-component.sh && git commit -m 'افزودن ابزار جست‌وجوی کامپوننت‌ها'`

### Task 2: Build component discovery references

**Files:**
- Create: `erp-ui-builder/references/directory-map.md`
- Create: `erp-ui-builder/references/component-index.json`
- Create: `erp-ui-builder/references/component-guide.md`
- Test: `tests/validate-catalog.sh`

**Interfaces:**
- Consumes: the Vue component paths in the accounts application.
- Produces: an index object with `components[]` entries containing `name`, `path`, `category`, and optional `guide`.

- [ ] **Step 1: Write the failing catalog test**

```bash
#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
jq -e '.components | length > 0' "$root/erp-ui-builder/references/component-index.json" >/dev/null
jq -e '.components[] | select(.name == "SmartDataTable" and .path == "frontend/src/components/shared/SmartDataTable.vue")' "$root/erp-ui-builder/references/component-index.json" >/dev/null
rg -q 'SmartDataTable' "$root/erp-ui-builder/references/component-guide.md"
rg -q 'frontend/src/components/shared' "$root/erp-ui-builder/references/directory-map.md"
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/validate-catalog.sh`

Expected: FAIL because the catalog files do not exist.

- [ ] **Step 3: Write the minimal references**

Create a directory map for page, domain component, shared, design, document, table, dashboard, service, design-system, and ux-core paths. Generate JSON entries for every `.vue` file in `frontend/src/components`, using a category derived from its first directory. Write guide entries for all canonical components named in `SKILL.md`, each with: when to use, path, invocation/slot guidance, and a prohibited substitute.

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/validate-catalog.sh`

Expected: PASS.

- [ ] **Step 5: Commit**

Run: `git add erp-ui-builder/references tests/validate-catalog.sh && git commit -m 'افزودن کاتالوگ و راهنمای کامپوننت‌های ERP'`

### Task 3: Package the complete skill and wire the low-token workflow

**Files:**
- Create: `erp-ui-builder/SKILL.md`
- Create: `erp-ui-builder/agents/openai.yaml`
- Create: `erp-ui-builder/references/hesabyar-ui-catalog.md`
- Create: `erp-ui-builder/scripts/scan-ui-context.sh`
- Modify: `erp-ui-builder/SKILL.md`
- Create: `README.md`

**Interfaces:**
- Consumes: the complete local skill directory.
- Produces: a repository that can be copied into a Codex skills directory.

- [ ] **Step 1: Write the failing package test**

```bash
#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for file in SKILL.md agents/openai.yaml references/hesabyar-ui-catalog.md scripts/scan-ui-context.sh; do
  [[ -f "$root/erp-ui-builder/$file" ]]
done
rg -q 'find-ui-component.sh' "$root/erp-ui-builder/SKILL.md"
rg -q 'Installation' "$root/README.md"
```

- [ ] **Step 2: Run test to verify it fails**

Run: `bash tests/validate-package.sh`

Expected: FAIL because the complete package has not been copied and wired.

- [ ] **Step 3: Write the minimal implementation**

Copy the source skill files byte-for-byte, then add an `Efficient Component Discovery` section to `SKILL.md`: run the lookup tool first, read the matching guide entry, inspect only the chosen component for unknown API details, and use `scan-ui-context.sh` only when no catalog match exists. Write a README with prerequisites (`bash`, `jq`, `rg`), installation path, lookup examples, and catalog update instructions.

- [ ] **Step 4: Run test to verify it passes**

Run: `bash tests/validate-package.sh && bash tests/validate-catalog.sh && bash tests/find-ui-component.test.sh`

Expected: PASS.

- [ ] **Step 5: Commit**

Run: `git add erp-ui-builder README.md tests/validate-package.sh && git commit -m 'انتشار کامل مهارت و راهنمای استفاده'`

### Task 4: Review and publish

**Files:**
- Modify: repository history only.

**Interfaces:**
- Consumes: complete passing package.
- Produces: `main` pushed to `origin`.

- [ ] **Step 1: Verify final state**

Run: `git diff --check && bash tests/find-ui-component.test.sh && bash tests/validate-catalog.sh && bash tests/validate-package.sh && git status --short`

Expected: all tests PASS and no uncommitted files.

- [ ] **Step 2: Push**

Run: `git push -u origin main`

Expected: `main` is created on GitHub and tracks `origin/main`.
