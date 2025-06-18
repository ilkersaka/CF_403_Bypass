const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();

  await page.goto(process.argv[2], { waitUntil: 'networkidle2' });

  const cookies = await page.cookies();
  cookies.forEach(c => {
    if (c.name.includes("cf_") || c.name.includes("bm")) {
      console.log(`${c.name}=${c.value}`);
    }
  });

  await browser.close();
})();
