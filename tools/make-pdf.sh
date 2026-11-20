#!/usr/bin/env bash
# Prints the page to an A4 PDF with headless Chrome. Serve docs/ first:
#   (cd docs && python3 -m http.server 8765)
set -e
cd "$(dirname "$0")/.."
google-chrome --headless=new --no-sandbox --disable-gpu --virtual-time-budget=4000 \
  --no-pdf-header-footer --print-to-pdf=docs/Kestrelle-launch-plan-DEMO.pdf \
  "http://localhost:8765/?static" 2>/dev/null
ls -la docs/Kestrelle-launch-plan-DEMO.pdf
