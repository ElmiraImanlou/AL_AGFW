pageextension 50304 "Company Info Ext" extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field("Name 2"; "Name 2")
            {

            }
            //PLZ_Postfach
            //Postfach

        }

        addafter("VAT Registration No.")
        {
            field("Post Office Box"; "Post Office Box") { }
            field("Office Postcode"; "Office Postcode") { }
        }
        addafter(Communication)
        {
            group("Extra Info")
            {
                Caption = 'Erweiterte Informationen';

                field(ExtraAddress; ExtraAddress) { }
                field("Extra Post Code"; "Extra Post Code") { }
                field("Extra City"; "Extra City") { }
                field("President of the Association"; "President of the Association") { }
                field("Managing directors"; "Managing directors") { }
                field("Vereinsregistergericht"; "Vereinsregistergericht") { }


            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}