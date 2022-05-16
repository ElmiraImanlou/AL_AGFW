page 50215 "Address Type List"
{
    PageType = List;
    Caption = 'Adressenarten';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Address Type";



    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowCaption = false;
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}