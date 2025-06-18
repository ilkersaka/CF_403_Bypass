
# 🛡️ CF_403_Bypass: Cloudflare Bypass & Recon Toolkit

cf-hunter, bug bounty ve sızma testi yapan araştırmacılar için hazırlanmış, Cloudflare gibi WAF sistemlerini aşmaya yönelik gelişmiş bir araçtır. Sadece izinli testler için kullanılır.

## 🚀 Özellikler
- ✅ User-Agent, Header spoofing
- 🍪 cf_clearance cookie otomatik alımı (puppeteer ile)
- 🧪 HEAD vs GET analizi
- ⚔️ ffuf ile dizin/parametre fuzzing
- 🌐 Proxy desteği (Tor, Burp, etc.)
- 📝 Loglama, renkli çıktı

## 🔧 Kurulum

```bash
https://github.com/ilkersaka/CF_403_Bypass.git
cd CF_403_Bypass
chmod +x cf_hunter.sh
npm install puppeteer
