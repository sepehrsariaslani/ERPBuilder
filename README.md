# ERP UI Builder

A portable Codex skill for building consistent, right-to-left Hesabyar ERP interfaces. It packages the canonical UI guidance, a component catalog, and narrow lookup tools so an agent can find an existing component before reading large parts of the frontend.

## Prerequisites

The scripts require:

- `bash`
- `jq`
- `rg` (ripgrep)

The lookup script also uses the standard `column` utility available on typical Linux systems.

## Installation

Copy the complete `erp-ui-builder` directory into the Codex skills directory:

```bash
cp -R erp-ui-builder "$CODEX_HOME/skills/"
```

Restart or reload Codex if it does not discover newly installed skills automatically. Keep the whole directory intact: `SKILL.md`, `agents/`, `references/`, and `scripts/` are all part of the package.

## Component lookup

From the package root, search the catalog before reading frontend files:

```bash
./erp-ui-builder/scripts/find-ui-component.sh SmartDataTable
./erp-ui-builder/scripts/find-ui-component.sh PersianDateInput
```

The output identifies the source path and the matching section in `erp-ui-builder/references/component-guide.md`. Read that guide entry, then inspect only the listed component if its API details are needed.

When no component matches, use the compact domain scan instead of a project-wide search:

```bash
./erp-ui-builder/scripts/scan-ui-context.sh procurement /absolute/path/to/accounts/frontend/src
```

## Updating the catalog

Set `ERP_UI_SOURCE_ROOT` to the target application's `frontend/src` directory. Validate the packaged catalog against the current source with:

```bash
ERP_UI_SOURCE_ROOT=/absolute/path/to/accounts/frontend/src bash tests/validate-catalog.sh
```

When components are added, removed, or moved, regenerate `erp-ui-builder/references/component-index.json` from the same source root, update the related entries in `component-guide.md` and `directory-map.md`, then run the validation again. The index generation command is:

```bash
export ERP_UI_SOURCE_ROOT=/absolute/path/to/accounts/frontend/src
rg --files "$ERP_UI_SOURCE_ROOT/components" -g '*.vue' \
  | sed "s#^$ERP_UI_SOURCE_ROOT/##" \
  | sed 's#^#frontend/src/#' \
  | sort \
  | jq -R -s '
      split("\\n")
      | map(select(length > 0) | (split("/")) as $segments | {
          name: ($segments[-1] | sub("\\.vue$"; "")),
          path: ($segments | join("/")),
          category: (if ($segments | length) > 4 then $segments[3] else "root" end)
        })
      | {components: .}
    ' > erp-ui-builder/references/component-index.json
```

Finally run the package checks with the same source root:

```bash
ERP_UI_SOURCE_ROOT=/absolute/path/to/accounts/frontend/src \
  bash tests/validate-package.sh && \
  bash tests/validate-catalog.sh && \
  bash tests/find-ui-component.test.sh
```
