page 50217 "Contact Category Assign."
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Contact Category Assignment";
    Caption = 'Zuordnung der Kontaktkategorie';
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Contact)
            {
                ShowCaption = false;

                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Kategorie Code field.';
                    ApplicationArea = All;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Kontakt Nr. field.';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the Gültig bis field.';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Gültig von field.';
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