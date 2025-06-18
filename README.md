
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
git clone https://github.com/kullaniciadi/cf-hunter.git
cd cf-hunter
chmod +x cf_hunter.sh
npm install puppeteer
