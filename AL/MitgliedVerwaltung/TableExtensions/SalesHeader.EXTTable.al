tableextension 50302 "Sales Header EXT" extends "Sales Header"
{
    fields
    {
        field(50233; InvoiceName; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50234; InvoiceYear; Code[50])
        {
            TableRelation = Years;

        }
        field(50235; MemberNo; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}