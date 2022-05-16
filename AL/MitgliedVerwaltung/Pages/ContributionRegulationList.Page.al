page 50232 "Contribution Regulation List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Contribution Regulation";
    SourceTableView = sorting("Member Type", year);
    Caption = 'Beitragsordnung List';


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;

                }
                field("Member Type"; Rec."Member Type")
                {
                    ToolTip = 'Specifies the value of the Mitgliedart field.';
                    ApplicationArea = All;

                }

                field("Until TJ/MA"; Rec."Until TJ/MA")
                {
                    ToolTip = 'Specifies the value of the Until Date TJ field.';
                    ApplicationArea = All;
                }

                field(GWh; Rec."GWh")
                {
                    ToolTip = 'Specifies the value of the GWh field.';
                    ApplicationArea = All;
                }
                field("Price WOB"; Rec."Price WOB")
                {
                    ToolTip = 'Specifies the value of the Price field.';
                    ApplicationArea = All;
                }
                field("Price WZP"; Rec."Price WZP")
                {
                    ToolTip = 'Specifies the value of the Betrag WZP field.';
                    ApplicationArea = All;
                }
                field("Price FUE"; Rec."Price FUE")
                {
                    ToolTip = 'Specifies the value of the Betrag FUE field.';
                    ApplicationArea = All;
                }
                field("Vote Number"; Rec."Vote Number")
                {
                    ToolTip = 'Specifies the value of the Stimmen field.';
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