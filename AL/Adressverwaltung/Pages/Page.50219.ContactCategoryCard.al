page 50219 "Contact Category Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Contact Category";
    Caption = 'Kontakt Kategorie Card';

    layout
    {
        area(Content)
        {
            group(Contact)
            {

                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Beschreibung field.';
                    ApplicationArea = All;
                }
                field(Locked; Rec.Locked)
                {
                    ToolTip = 'Specifies the value of the Gesperrt field.';
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