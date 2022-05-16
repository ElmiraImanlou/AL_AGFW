page 50213 "Contact Address Card"
{
    Caption = 'Contact Address Card';
    DataCaptionExpression = Caption;
    PageType = Card;
    SourceTable = "Contact Address";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the alternate address.';
                }
                field("Company Name"; "Company Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the company for the alternate address.';
                }
                field("Address Type"; Rec."Address Type")
                {
                    ToolTip = 'Specifies the value of the Address Type field.';
                    ApplicationArea = All;
                }

                field(Address; Address)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the alternate address of the contact.';
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; City)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the city of the contact''s alternate address.';
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the telephone number for the alternate address.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the telephone number for the alternate address.';
                }
                field("Mobile Phone No."; "Mobile Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the mobile phone number for the alternate address.';
                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the fax number for the alternate address.';
                }
                field("Telex No."; "Telex No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the telex number for the alternate address.';
                }
                field(Pager; Pager)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the pager number for the contact at the alternate address.';
                }
                field("Telex Answer Back"; "Telex Answer Back")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the telex answer back number for the alternate address.';
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the e-mail address for the contact at the alternate address.';
                }
                field("Home Page"; "Home Page")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the contact''s web site.';
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {

        }
    }

    var
        Text000: Label 'untitled';

    procedure Caption(): Text
    var
        Cont: Record Contact;
    begin
        if Cont.Get("Contact No.") then
            exit("Contact No." + ' ' + Cont.Name + ' ' + Code + ' ' + "Company Name");

        exit(Text000);
    end;
}

