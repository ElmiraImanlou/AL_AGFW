pageextension 50211 ContactListExt extends "Contact List"
{
    layout
    {
        addbefore("Company Name")
        {

            // field(AddressType; Rec.AddressType)
            // {
            //     ToolTip = 'Specifies the value of the Address Type field.';
            //     ApplicationArea = All;
            // }
            field("Member Type"; Rec."Member Type")
            {
                ToolTip = 'Specifies the value of the Member Type field.';
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("Assigned User"; Rec."Assigned User") { }
        }

        addfirst(factboxes)
        {
            part(ContactCategoriesSubpage; "Contact Category Ass. SubPage")
            {

                Caption = 'Kontakt Kategorie';
                SubPageLink = "Contact No." = field("No.");
            }
            part(AdditionalAddresses; "Contact Address SubPage")
            {
                Caption = 'Zusätzliche Adressen';
                SubPageLink = "Contact No." = field("No.");
            }
        }
    }


    actions
    {
        addfirst("C&ontact")
        {
            action("Contact Categorie")
            {
                ApplicationArea = All;
                RunObject = page "Contact Category Assign.";
                RunPageLink = "Contact No." = field("No.");
                Image = Category;

            }
            group("Additional Address")
            {
                Caption = 'Zusätzliche Adresse';
                Image = Addresses;
                action("Card Page")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Karte';
                    Image = EditLines;
                    RunObject = Page "Contact Address List";
                    RunPageLink = "Contact No." = FIELD("No.");
                    ToolTip = 'View or change detailed information about the contact.';
                }

            }


        }
    }

    var
        myInt: Integer;

    trigger OnAfterGetRecord()
    var
        Member: Record Members;
    begin

        if Member.Get(Rec."No.") then
            Rec."Member Type" := Member."Members Type"
        else
            Rec."Member Type" := '';
    end;

}