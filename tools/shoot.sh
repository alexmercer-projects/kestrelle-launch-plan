#!/usr/bin/env bash
# Screenshots with headless Chrome. Usage: tools/shoot.sh <url> <outdir>
set -e
URL=${1:-http://localhost:8765/}; OUT=${2:-screenshots}
mkdir -p "$OUT"
shot(){ google-chrome --headless=new --no-sandbox --hide-scrollbars --disable-gpu --force-device-scale-factor=1 --virtual-time-budget=4000 --window-size=$2 --screenshot="$OUT/$1" "$URL?static" 2>/dev/null; }
shot desktop-1440.png 1440,900
shot desktop-1440-full.png 1440,14000
shot mobile-390.png 390,844
shot mobile-390-full.png 390,24000
