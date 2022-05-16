page 50212 "Contact Address SubPage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Contact Address";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater("Additional Addresses")
            {

                ShowCaption = false;
                field("Address Type"; Rec."Address Type")
                {
                    ToolTip = 'Specifies the value of the Adressart field.';
                    ApplicationArea = All;

                }
                field(CompanyName; Rec."Company Name")
                {
                    ToolTip = 'Specifies the value of the Company Name field.';
                    ApplicationArea = All;
                }

                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.';
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the e-mail address for the contact at the alternate address.';
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the telephone number for the alternate address.';
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the mobile phone number for the alternate address.';
                    ApplicationArea = All;
                }


            }
        }
    }
}