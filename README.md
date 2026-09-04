## APSS Shopify Enhancements (đọc có chọn lọc nhé tại AI viết á :"> Tui chưa test hết nên cũng ko cf đc nó viết có đúng ko...)

Starter per-tenant extension for Business Central 28 and the Microsoft Shopify Connector.

## Included features

- Builds Shopify titles as `Brand - Product Number - Description`.
- Uses the standard Manufacturer Name as Brand.
- Adds Has Shopify Image, Shopify Ready, and Shopify Validation fields to Item.
- Adds actions to refresh readiness for selected items or all items.
- Allows filtering the Item List and, when exposed by the connector request page, Add Items by Shopify Ready = Yes.

## Before publishing

1. Open `app.json` and confirm the platform, application, runtime, ID range, and Shopify Connector dependency version match the sandbox.
2. Open `.vscode/launch.json` and replace `Sandbox20260305` if the actual BC 28 sandbox has a different name.
3. Run **AL: Download Symbols**.
4. Compile with `Ctrl+Shift+B`.
5. Publish with `F5` only to a sandbox.

## APSS custom-field mapping

This standalone package cannot reference APSS private custom fields without the APSS app ID and dependency metadata. It therefore uses only standard BC fields.

In `ShopifyProductTitle.Codeunit.al`:

- Replace `GetBrandName()` if APSS Brand Code/Brand Name is stored in a custom Item field/table.
- Replace `GetProductNumber()` if APSS Manufacturer Part No. is different from Vendor Item No.

The same functions are reused by the readiness validation, so each source only needs to be changed once.

## Sandbox test

1. Select one test Item with Manufacturer Code, Vendor Item No., Description, Unit Price, and Item Picture.
2. Run **Refresh Selected Shopify Readiness**.
3. Confirm Has Shopify Image and Shopify Ready are Yes.
4. Set the Shopify Shop's created-product status to Draft.
5. Add the item to Shopify and confirm its title.
6. Change the BC Description, run Sync Products, and confirm the same Shopify product updates without creating a duplicate.

## Price and metafields

This first package intentionally leaves price calculation with the standard connector. Configure the Shopify Customer Price Group, currency, VAT settings, and run Sync Prices to Shopify. Resolve the missing VAT Posting Setup combination before testing prices.

Test metafield definitions manually before adding automatic mapping. Automatic metafield mapping should be implemented as phase two after the title and readiness controls pass sandbox testing.

## Production warning

Do not publish directly to production. Compile and test in the BC 28 sandbox, export the `.app`, and send the source plus test evidence to Nick for review.

#
