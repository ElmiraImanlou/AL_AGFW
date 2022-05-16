codeunit 50301 Delete
{
    trigger OnRun()
    begin


    end;

    var

    procedure DeleteSalesINvoice(SalesInvoiceHeader: Record "Sales Invoice Header")

    begin
        if SalesInvoiceHeader.Get(SalesInvoiceHeader."No.") then
            repeat
                SalesInvoiceHeader."No. Printed" := 1;
                SalesInvoiceHeader.Modify(true);
                SalesInvoiceHeader.Delete(true);
            until SalesInvoiceHeader.Next() = 0;

    end;

    procedure DeleteGLEntries()
    var
        GlEntry: Record "G/L Entry";
    begin
        GlEntry.SetRange("Entry No.", 63);
        if GlEntry.FindFirst() then
            // repeat
                GlEntry.Delete(true);
        // until GlEntry.Next() = 0;
    end;

    procedure DeleteCustomerPosten()
    var
        CustLedgerEntry: record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.Setfilter("Entry No.", '>%1', 60);
        if CustLedgerEntry.FindSet() then
            CustLedgerEntry.DeleteAll(true);
        // repeat
        // CustLedgerEntry.Delete(true);
        // until CustLedgerEntry.Next()=0;
    end;
}
