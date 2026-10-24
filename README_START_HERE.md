# Akaora Inventory Basics — Website Edition

**Product:** Akaora Inventory Basics
**Version:** 1.0.0 (Basics edition)
**Developer:** Akshay Goyal · Akaora Technologies
**Website:** https://www.akaoratechnologies.in/

## Quick start (Windows)

1. Extract the ZIP completely.
2. Double-click **START_WEBSITE.bat**. The local launcher opens **http://localhost:8767/** in your browser.
3. Sign in or register with **Email + Password** using your Firebase Authentication account; verify your email before creating the shop.
4. After verified sign-in, complete Shop Setup and begin with Products & stock.
5. For publishing online, upload `index.html` to an **HTTPS** hosting service and add its domain to the Firebase project's Authentication Authorized domains.

The launcher tries the Windows Python launcher / Python first, then falls back to the included PowerShell local web server. Keep the launcher open while using the application. `index.html` may be opened directly for inspection, but Firebase sign-in and Bluetooth printing are more reliable on **localhost/HTTPS**.

## What's included

- Dashboard, products & stock, product weight/size variations, inventory adjustments
- Fast and standard billing, invoice history, customer contact fields and payments
- Barcode Studio and label printing, Bluetooth receipt and restaurant KOT workflows
- Parties: **Customers and Suppliers**, with essential name, phone, email and basic customer purchase count
- Purchases, expenses, reports, settings, backup export/import
- Email/password login, registration, email verification and Forgot Password (Firebase)
- Mobile responsive UI

## What's intentionally excluded

- Staff profiles, attendance management, salary advances, payroll and payslip generation
- Offers (automatic free gifts or promotional discounts)
- Coupon issuance, coupon redemption and all coupon templates
- Advanced customer CRM, photo and loyalty tools, custom party categories

Navigation, checkout promotion calculations and coupon redemption have been disabled in Basics. Premium data is stripped from exported and imported `.akaora` backups by the Basics UI. A web application delivered as public client-side HTML **does not enforce secure subscription/licensing entitlements**; proper licensing requires backend authorization.

## Keeping Basics and Pro separate

This edition uses its own `akaora_basics_*` browser-storage keys and a **separate localhost port (8767)** so it does not automatically read Pro's local shop data. It uses the owner's supplied Firebase project `akaora-inventory` for authentication, but **does not sync inventory to the cloud**. A different browser or device does not share saved stock automatically.

## Firebase settings required

1. Firebase Console > Authentication > Sign-in method > **Email/Password > Enable**.
2. Firebase Console > Authentication > Settings > Authorized domains: allow your published site and localhost (if required).
3. Internet connectivity is required for Firebase authentication and PDF.js when used.

## Hardware caveats

- Direct Web Bluetooth requires supported Chrome/Edge, HTTPS or localhost, and compatible printer firmware. The physical PSF588 printer was not available for verification.
- 58mm is supported in software; 80mm/88mm options require a printer designed for that paper width.
- Thermal printing and camera barcode scanning depend on browser and device support.

## Data privacy and backups

The workspace is stored in the browser locally, **not encrypted**. Only save customer contact data with appropriate consent and protect the device. Export `.akaora` backups regularly.
