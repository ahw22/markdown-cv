#!/usr/bin/env bash
# Print a standalone HTML letter (e.g. motivationsschreiben/*.html) to PDF
# using headless Chrome/Chromium — same approach as generate-pdf.sh.
#
# Usage: ./generate-letter-pdf.sh motivationsschreiben/bearingpoint.html [output.pdf]

set -euo pipefail

cd "$(dirname "$0")"

if [ $# -lt 1 ]; then
  echo "Usage: $0 <letter.html> [output.pdf]" >&2
  exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.html}.pdf}"

if [ ! -f "$INPUT" ]; then
  echo "Error: $INPUT not found." >&2
  exit 1
fi

CHROME_BIN=""
for candidate in google-chrome google-chrome-stable chromium chromium-browser; do
  if command -v "$candidate" >/dev/null 2>&1; then
    CHROME_BIN="$candidate"
    break
  fi
done

if [ -z "$CHROME_BIN" ]; then
  echo "Error: no Chrome/Chromium binary found on PATH." >&2
  exit 1
fi

echo "Printing $INPUT to PDF with $CHROME_BIN..."
"$CHROME_BIN" \
  --headless \
  --disable-gpu \
  --no-pdf-header-footer \
  --print-to-pdf="$OUTPUT" \
  "file://$(pwd)/$INPUT"

echo "Done: $OUTPUT"
