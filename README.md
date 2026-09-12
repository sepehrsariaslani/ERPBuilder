# سازندهٔ رابط کاربری ERP

مهارت قابل‌انتقال Codex برای ساخت رابط‌های یکدست، راست‌به‌چپ و عملیاتی حسابیار. این بسته راهنمای مرجع رابط کاربری، کاتالوگ کامپوننت‌ها و ابزارهای جست‌وجوی محدود را فراهم می‌کند تا پیش از خواندن بخش‌های بزرگ فرانت‌اند، کامپوننت موجود پیدا شود.

## پیش‌نیازها

اسکریپت‌ها به موارد زیر نیاز دارند:

- `bash`
- `jq`
- `rg` (ripgrep)

اسکریپت جست‌وجو از ابزار استاندارد `column` نیز استفاده می‌کند که معمولاً در Linux موجود است.

## نصب

پوشهٔ کامل `erp-ui-builder` را در پوشهٔ مهارت‌های Codex کپی کنید:

```bash
cp -R erp-ui-builder "$CODEX_HOME/skills/"
```

اگر Codex مهارت جدید را خودکار پیدا نکرد، آن را دوباره بارگذاری یا راه‌اندازی کنید. همهٔ محتویات پوشه را نگه دارید؛ `SKILL.md`، `agents/`، `references/` و `scripts/` بخش‌های بسته هستند.

## جست‌وجوی کامپوننت

از ریشهٔ بسته، پیش از خواندن فایل‌های فرانت‌اند در کاتالوگ جست‌وجو کنید:

```bash
./erp-ui-builder/scripts/find-ui-component.sh SmartDataTable
./erp-ui-builder/scripts/find-ui-component.sh PersianDateInput
```

خروجی مسیر مبدأ و بخش متناظر در `erp-ui-builder/references/component-guide.md` را نشان می‌دهد. ابتدا همان بخش راهنما را بخوانید و فقط اگر جزئیات API لازم بود، کامپوننت فهرست‌شده را بررسی کنید.

اگر کامپوننت متناظری نبود، به‌جای جست‌وجوی کل پروژه از اسکن فشردهٔ دامنه استفاده کنید:

```bash
./erp-ui-builder/scripts/scan-ui-context.sh procurement /absolute/path/to/accounts/frontend/src
```

## به‌روزرسانی کاتالوگ

مقدار `ERP_UI_SOURCE_ROOT` را مسیر `frontend/src` برنامهٔ هدف قرار دهید. سپس کاتالوگ بسته را با مبدأ فعلی اعتبارسنجی کنید:

```bash
ERP_UI_SOURCE_ROOT=/absolute/path/to/accounts/frontend/src bash tests/validate-catalog.sh
```

با افزودن، حذف یا جابه‌جایی کامپوننت‌ها، `erp-ui-builder/references/component-index.json` را از همان ریشهٔ مبدأ دوباره بسازید، مدخل‌های مرتبط در `component-guide.md` و `directory-map.md` را به‌روزرسانی کنید و اعتبارسنجی را تکرار کنید. فرمان ساخت نمایه:

```bash
export ERP_UI_SOURCE_ROOT=/absolute/path/to/accounts/frontend/src
CANONICAL_COMPONENTS="$(sed -n 's/^## //p' erp-ui-builder/references/component-guide.md | jq -R . | jq -s .)"
rg --files "$ERP_UI_SOURCE_ROOT/components" -g '*.vue' \
  | sed "s#^$ERP_UI_SOURCE_ROOT/##" \
  | sed 's#^#frontend/src/#' \
  | sort \
  | jq --argjson canonical "$CANONICAL_COMPONENTS" -R -s '
      split("\n")
      | map(select(length > 0) | (split("/")) as $segments | {
          name: ($segments[-1] | sub("\\.vue$"; "")),
          path: ($segments | join("/")),
          category: (if ($segments | length) > 4 then $segments[3] else "root" end)
        } as $component | if ($canonical | index($component.name)) then $component + {
          guide: ("references/component-guide.md#" + ($component.name | ascii_downcase))
        } else $component end)
      | {components: .}
    ' > erp-ui-builder/references/component-index.json
```

در پایان، بررسی‌های بسته را با همان ریشهٔ مبدأ اجرا کنید:

```bash
export ERP_UI_SOURCE_ROOT=/absolute/path/to/accounts/frontend/src
bash tests/validate-package.sh && \
  bash tests/validate-catalog.sh && \
  bash tests/find-ui-component.test.sh && \
  bash tests/scan-ui-context.test.sh
```
