#!/usr/bin/env bash
# Build the Jekyll site and print the CV to a PDF using headless Chrome/Chromium.
# This bakes in today's date automatically via `site.time` (see _layouts/cv.html)
# and honors the print CSS (media/<style>-print.css), same as printing from a
# browser tab, but without any manual steps.
#
# Usage: ./generate-pdf.sh [output-file]

set -euo pipefail

cd "$(dirname "$0")"

OUTPUT="${1:-cv.pdf}"

# Find a headless-capable Chrome/Chromium binary.
CHROME_BIN=""
for candidate in google-chrome google-chrome-stable chromium chromium-browser; do
  if command -v "$candidate" >/dev/null 2>&1; then
    CHROME_BIN="$candidate"
    break
  fi
done

if [ -z "$CHROME_BIN" ]; then
  echo "Error: no Chrome/Chromium binary found on PATH." >&2
  echo "Install one, e.g.: sudo apt install chromium-browser" >&2
  exit 1
fi

echo "Building site with Jekyll..."
bundle exec jekyll build

SITE_FILE="$(pwd)/_site/index.html"
if [ ! -f "$SITE_FILE" ]; then
  echo "Error: $SITE_FILE not found after build." >&2
  exit 1
fi

echo "Printing to PDF with $CHROME_BIN..."
"$CHROME_BIN" \
  --headless \
  --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf="$OUTPUT" \
  --print-to-pdf-no-header \
  "file://$SITE_FILE"

echo "Done: $OUTPUT"
