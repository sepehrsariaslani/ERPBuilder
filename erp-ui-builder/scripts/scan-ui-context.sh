#!/usr/bin/env bash
set -euo pipefail

domain="${1:-}"
root="${2:-frontend/src}"

if [[ -z "$domain" ]]; then
  printf 'استفاده: %s <حوزه> [مسیر-frontend-src]\n' "$0"
  printf 'نمونه: %s procurement\n' "$0"
  exit 2
fi

print_files() {
  local path="$1"
  find "$path" -type f \( -name '*.vue' -o -name '*.js' -o -name '*.ts' \) -print \
    | sed "s#^$root/#frontend/src/#" \
    | sort \
    | head -n 20
}

printf 'حوزه: %s\n' "$domain"
for area in "pages/$domain" "components/$domain" "services/$domain"; do
  path="$root/$area"
  if [[ -d "$path" ]]; then
    printf '\nfrontend/src/%s\n' "$area"
    print_files "$path"
  fi
done

terms="$domain"
for path in "$root/pages/$domain" "$root/components/$domain"; do
  if [[ -d "$path" ]]; then
    while IFS= read -r file; do
      stem="${file##*/}"
      stem="${stem%.*}"
      term="$(printf '%s' "$stem" | sed -E 's/([a-z])([A-Z])/\1 \2/g' | awk '{print tolower($1)}')"
      [[ -n "$term" ]] && terms="$terms|$term"
    done < <(find "$path" -type f \( -name '*.vue' -o -name '*.js' -o -name '*.ts' \) -print)
  fi
done

if [[ "$domain" == "procurement" ]]; then
  terms="procurement|purchase|material|supplier|subcontract|quality|landedcost|rfq|pricing"
fi
if [[ -d "$root/services" ]]; then
  service_matches="$(find "$root/services" -type f \( -name '*.vue' -o -name '*.js' -o -name '*.ts' \) -print \
    | while IFS= read -r file; do
        relative="${file#"$root/"}"
        [[ "$relative" == services/*/* ]] && continue
        basename="${file##*/}"
        if printf '%s' "$basename" | grep -Eqi "$terms"; then
          printf 'frontend/src/%s\n' "$relative"
        fi
      done | sort | head -n 20)"
  if [[ -n "$service_matches" ]]; then
    printf '\nfrontend/src/services\n%s\n' "$service_matches"
  fi
fi

printf '\nنقطه‌های ورود رابط مشترک\n'
for path in \
  "$root/components/shared" \
  "$root/components/design" \
  "$root/components/document" \
  "$root/design-system"; do
  if [[ -d "$path" ]]; then
    print_files "$path" | head -n 8
  fi
done
