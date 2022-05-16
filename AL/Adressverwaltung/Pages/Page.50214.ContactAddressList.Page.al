page 50214 "Contact Address List"
{
    Caption = 'Contact Address List';
    CardPageID = "Contact Address Card";
    DataCaptionFields = "Contact No.", "Code";
    Editable = false;
    PageType = List;
    SourceTable = "Contact Address";

    layout
    {
        area(content)
        {
            repeater("Contact Address")
            {
                ShowCaption = false;
                field("Code"; Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the alternate address.';
                }
                field("Address Type"; Rec."Address Type")
                {
                    ToolTip = 'Specifies the value of the Address Type field.';
                    ApplicationArea = All;
                }
                field("Company Name"; "Company Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the name of the company for the alternate address.';
                }
                field("Company Name 2"; "Company Name 2")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the additional part of the company name for the alternate address.';
                    Visible = false;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the alternate address of the contact.';
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies additional address information.';
                    Visible = false;
                }
                field(City; City)
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the city of the contact''s alternate address.';
                    Visible = false;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the postal code.';
                    Visible = false;
                }
                field(County; County)
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the county for the contact''s alternate address.';
                    Visible = false;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the country/region of the address.';
                    Visible = false;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the telephone number for the alternate address.';
                }
                field("Fax No."; "Fax No.")
                {
                    ApplicationArea = RelationshipMgmt;
                    ToolTip = 'Specifies the fax number for the alternate address.';
                    Visible = false;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = RelationshipMgmt;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the e-mail address for the contact at the alternate address.';
                    Visible = false;
                }
            }
        }

    }


}

