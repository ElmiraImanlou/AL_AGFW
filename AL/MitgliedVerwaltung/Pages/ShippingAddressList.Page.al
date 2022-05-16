page 50225 "Shipping Address List"
{
    Caption = 'Versandadressen';
    PageType = List;
    CardPageId = "Shipping Address Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTableView = sorting("Contact No.");
    SourceTable = "Shipping Address";



    layout
    {
        area(Content)
        {
            repeater("Shipping Address")
            {
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;

                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    ApplicationArea = All;
                    TableRelation = "Member Address Type".Description;
                }

                field("Contact Person"; Rec."Contact Person")
                {
                    ToolTip = 'Specifies the value of the Contact Person field.';
                    ApplicationArea = All;
                    TableRelation = contact.Name where("Company No." = field("Contact No."), Type = const(Person));
                }
                field(Addition; Rec.Addition)
                {
                    ToolTip = 'Specifies the value of the Zusatz field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;

}