permissionset 90300 "APSS SHOPIFY ENH"
{
    Assignable = true;
    Caption = 'APSS Shopify Enhancements';

    Permissions =
        tabledata Item = RM,
        codeunit "APSS Shopify Product Title" = X,
        codeunit "APSS Shopify Readiness Mgt." = X;
}
