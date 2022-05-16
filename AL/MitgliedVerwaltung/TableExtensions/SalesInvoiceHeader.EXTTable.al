tableextension 50303 "Sales Invoice Header EXT" extends "Sales Invoice Header"
{
    fields
    {
        field(50234; InvoiceYear; Code[50])
        {


            // trigger OnValidate()
            // var
            //     SalesHeader: Record "Sales Header";
            // begin
            //     InvoiceYear := SalesHeader.InvoiceYear;
            //     Rec.Insert(true);
            //     Rec.Modify(true);
            // end;

        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}