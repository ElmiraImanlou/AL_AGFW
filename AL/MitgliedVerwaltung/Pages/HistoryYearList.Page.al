page 50234 "History Year List"
{
    Caption = 'Beitragsjahr Geschichte';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "History year";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                ShowCaption = false;

                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(MemberType; Rec.MemberType)
                {
                    ToolTip = 'Specifies the value of the MemberType field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(MemberNo; Rec.MemberNo)
                {
                    ToolTip = 'Specifies the value of the Mitglied Nr. field.';
                    ApplicationArea = All;
                }
                field(MemberDate; Rec.MemberDate)
                {
                    ToolTip = 'Specifies the value of the MemberDate field.';
                    ApplicationArea = All;
                }
                field(WOBSoll; Rec."WOB Soll")
                {
                    ToolTip = 'Specifies the value of the Soll field.';
                    ApplicationArea = All;
                }
                field(WOBIST; Rec."WOB IST")
                {
                    ToolTip = 'Specifies the value of the IST field.';
                    ApplicationArea = All;
                }
                field(WOBDifference; Rec."WOB Difference")
                {
                    ToolTip = 'Specifies the value of the Difference field.';
                    ApplicationArea = All;
                }

                field(WOBDatum; Rec."WOB Date")
                {
                    ToolTip = 'Specifies the value of the Datum field.';
                    ApplicationArea = All;
                }
                field(WOBComment; Rec."WOB Comment")
                {
                    ToolTip = 'Specifies the value of the Comment field.';
                    ApplicationArea = All;
                }
                field(WOB; Rec.WOB)
                {
                    ToolTip = 'Specifies the value of the WOB field.';
                    ApplicationArea = All;
                }
                field(ContactNo; Rec.ContactNo)
                {
                    ToolTip = 'Specifies the value of the ContactNo field.';
                    ApplicationArea = All;
                }
                field(ContactNoFUE; Rec.ContactNoFUE)
                {
                    ToolTip = 'Specifies the value of the ContactNoFUE field.';
                    ApplicationArea = All;
                }
                field(ContactNoWZP; Rec.ContactNoWZP)
                {
                    ToolTip = 'Specifies the value of the ContactNoWZP field.';
                    ApplicationArea = All;
                }
                field(OrderNo_WOB; Rec.OrderNo_WOB)
                {
                    ToolTip = 'Specifies the value of the Bestellnummer WOB field.';
                    ApplicationArea = All;
                }
                field(OrderNo_WZP; Rec.OrderNo_WZP)
                {
                    ToolTip = 'Specifies the value of the Bestellnummer WZP field.';
                    ApplicationArea = All;
                }
                field(OrderNo_FUE; Rec.OrderNo_FUE)
                {
                    ToolTip = 'Specifies the value of the Bestellnummer FUE field.';
                    ApplicationArea = All;
                }
                field(AmountCalc; Rec.AmountCalc)
                {
                    ToolTip = 'Specifies the value of the Anteilig für das jahr field.';
                    ApplicationArea = All;
                }
                field(AmountCalcFUE; Rec.AmountCalcFUE)
                {
                    ToolTip = 'Specifies the value of the Anteilig für das jahr Fu.E field.';
                    ApplicationArea = All;
                }
                field(AmountCalcWZP; Rec.AmountCalcWZP)
                {
                    ToolTip = 'Specifies the value of the Anteilig für das jahr WZP field.';
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