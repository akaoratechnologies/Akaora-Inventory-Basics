# Akaora Inventory Basics — verification notes

## Automated checks completed

- Syntax checks: all 29 non-module JavaScript blocks passed Node.js syntax validation.
- Title/branding: Akaora Inventory Basics.
- Desktop nav: Dashboard, Products & stock, Fast Billing, Barcode Studio, Bluetooth printing, Bills & payments, Parties, Purchases, Expenses, Reports, Settings.
- Staff, Offers, Coupons, and standalone Customers pages removed from navigation and guarded on navigation calls.
- Offer engine gifts() and discounts() return empty arrays in Basics.
- Billing rendered with coupon panels removed.
- Parties Customers/Suppliers tab rendering and route blocking tested in Chromium with a mocked verified session.
- 390px viewport: no horizontal page overflow in tested dashboard.
- Separate Basics local-storage prefixes verified in source.

## Not verified / known limitations

- The automated browser test used a mocked verified session because outbound Firebase Authentication cannot complete in this environment. Production Email/Password auth still requires Firebase console setup.
- Physical PSF588 Bluetooth printing and mobile camera scanning were not verified.
- All inherited inventory modules have not been retested end-to-end against real business data.
- Restricting features in a public client-side bundle is not tamper-resistant access control; use backend product entitlements for commercial plan enforcement.
