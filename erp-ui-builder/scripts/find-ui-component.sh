#!/usr/bin/env bash
set -euo pipefail
query="${1:-}"
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
[[ -n "$query" ]] || { printf 'Usage: %s <component-or-keyword>\n' "$0" >&2; exit 2; }
matches="$(jq -r --arg query "$query" '
  .components[] | select((.name + " " + .path + " " + .category | ascii_downcase) | contains($query | ascii_downcase)) |
  "\(.name)\t\(.path)\t\(.category)\t\(.guide // "")"
' "$root/references/component-index.json")"
[[ -n "$matches" ]] || { printf 'No component found for: %s\n' "$query" >&2; exit 1; }
printf '%s\n' "$matches" | column -ts $'\t'
