page 50216 "Members List"
{
    ApplicationArea = Basic, Suite, Service;
    Caption = 'Mitglied List';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = Members;
    SourceTableView = sorting("Company No.");
    PromotedActionCategories = 'New,Process,Report,Contact,Navigate';
    CardPageID = "Member Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Members)

            {
                ShowCaption = false;

                field("No."; Rec."No.")
                {
                    Style = Strong;
                    ToolTip = 'Specifies the value of the Nr. field.';
                    ApplicationArea = All;
                }
                field("Company No."; Rec."Company No.")
                {
                    ToolTip = 'Specifies the value of the UnternehmensNr. field.';
                    ApplicationArea = All;
                }
                field("Members Type"; Rec."Members Type")
                {
                    ToolTip = 'Specifies the value of the Mitgliedsart field.';
                    ApplicationArea = All;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Specifies the value of the Unternehmensname field.';
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

    trigger OnAfterGetRecord()
    var

    begin


    end;

    var




}