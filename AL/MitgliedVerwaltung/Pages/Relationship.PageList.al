page 50238 "Relationship List"
{
    Caption = 'Beziehung List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTableView = sorting(Code, Description);
    SourceTable = Relationship;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}