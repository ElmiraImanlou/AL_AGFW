page 50237 "Member Price Of Invoice List"
{
    Caption = 'Rechnungsbeitrag List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Member Price Of Invoice";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Nr. field.';
                    ApplicationArea = All;
                }

                field(YearCode; Rec.YearCode)
                {
                    ToolTip = 'Specifies the value of the YearCode field.';
                    ApplicationArea = All;
                }
                field("Contribution Money"; Rec."Contribution Money")
                {
                    ToolTip = 'Specifies the value of the Contribution Money field.';
                    ApplicationArea = All;
                }
                field("Contribution SOLL"; Rec."Contribution SOLL")
                {
                    ToolTip = 'Specifies the value of the Contribution SOLL field.';
                    ApplicationArea = All;
                }
                field("Contribution IST"; Rec."Contribution IST")
                {
                    ToolTip = 'Specifies the value of the Contribution IST field.';
                    ApplicationArea = All;
                }
                field("Date of Invoice"; Rec."Date of Invoice")
                {
                    ToolTip = 'Specifies the value of the Date of Invoice field.';
                    ApplicationArea = All;
                }
                field("Contribution Type"; Rec."Contribution Type")
                {
                    ToolTip = 'Specifies the value of the Contribution Type field.';
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Reduzierungsgrund field.';
                    ApplicationArea = All;
                }
                field(WOB; Rec.WOB)
                {
                    ToolTip = 'Specifies the value of the WOB field.';
                    ApplicationArea = All;
                }
                field("ContactNo."; Rec."ContactNo.")
                {
                    ToolTip = 'Specifies the value of the ContactNo. field.';
                    ApplicationArea = All;
                }
                field(FuEISAmount; Rec.FuEISAmount)
                {
                    ToolTip = 'Specifies the value of the Fu.E Umlage IST field.';
                    ApplicationArea = All;
                }
                field(WZPISAmount; Rec.WZPISAmount)
                {
                    ToolTip = 'Specifies the value of the Beitrag WZP IS field.';
                    ApplicationArea = All;
                }
                field(MemberDate; Rec.MemberDate)
                {
                    ToolTip = 'Specifies the value of the Mitglied Seit field.';
                    ApplicationArea = All;
                }
                field(MemberNo; Rec.MemberNo)
                {
                    ToolTip = 'Specifies the value of the Mitglied Nr. field.';
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