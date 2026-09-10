#!/usr/bin/env bash
set -euo pipefail

domain="${1:-}"
root="${2:-frontend/src}"

if [[ -z "$domain" ]]; then
  printf 'Usage: %s <domain> [frontend-src-path]\n' "$0"
  printf 'Example: %s procurement\n' "$0"
  exit 2
fi

printf 'Domain: %s\n' "$domain"
for area in "pages/$domain" "components/$domain" "services/$domain"; do
  path="$root/$area"
  if [[ -d "$path" ]]; then
    printf '\n%s\n' "$path"
    find "$path" -maxdepth 2 -type f \
      \( -name '*.vue' -o -name '*.js' -o -name '*.ts' \) \
      -printf '%P\n' | sort | head -n 20
  fi
done

printf '\nShared UI entry points\n'
for path in \
  "$root/components/shared" \
  "$root/components/design" \
  "$root/components/document" \
  "$root/design-system"; do
  if [[ -d "$path" ]]; then
    find "$path" -maxdepth 1 -type f \
      \( -name '*.vue' -o -name '*.js' -o -name '*.ts' \) \
      -printf '%p\n' | sort | head -n 8
  fi
done
