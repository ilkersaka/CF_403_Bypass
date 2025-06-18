#!/bin/bash

URL="$1"
PROXY="$2"
COOKIE="cf_clearance=XYZ123456789; __cf_bm=ABC987654321"

if [[ -z "$URL" ]]; then
  echo "Kullanım: $0 <url> [proxy]"
  exit 1
fi

green="\e[32m"
red="\e[31m"
reset="\e[0m"

UAS=(
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/122 Safari/537.36"
  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Safari/605.1.15"
)

function random_ip() {
  echo "$((RANDOM % 223)).$((RANDOM % 255)).$((RANDOM % 255)).$((RANDOM % 255))"
}

function try_request() {
  desc="$1"
  shift
  echo -e "\n🔎 $desc"
  if [[ -n "$PROXY" ]]; then
    code=$(curl -x "$PROXY" -s -o /dev/null -w "%{http_code}" "$@")
  else
    code=$(curl -s -o /dev/null -w "%{http_code}" "$@")
  fi
  if [[ "$code" == "200" ]]; then
    echo -e "${green}✅ Başarılı - HTTP $code${reset}"
  else
    echo -e "${red}❌ Başarısız - HTTP $code${reset}"
  fi
}

echo "🎯 Hedef: $URL"
[[ -n "$PROXY" ]] && echo "🌐 Proxy: $PROXY"

# 1 - Basit User-Agent
try_request "User-Agent spoof" -A "${UAS[0]}" "$URL"

# 2 - Referer ve Origin
try_request "Referer ve Origin ekli" -A "${UAS[1]}" -H "Referer: $URL" -H "Origin: $URL" "$URL"

# 3 - Cookie ekli
try_request "cf_clearance çerezi" -A "${UAS[0]}" -H "Cookie: $COOKIE" "$URL"

# 4 - X-Forwarded-For
try_request "Sahte IP (X-Forwarded-For)" -A "${UAS[0]}" -H "X-Forwarded-For: $(random_ip)" "$URL"

# 5 - HTTP/2 ile
try_request "HTTP/2 ile istek" --http2 -A "${UAS[0]}" "$URL"

# 6 - HEAD vs GET
for method in GET HEAD; do
  try_request "$method yöntemi" -X "$method" -A "${UAS[1]}" "$URL"
done
