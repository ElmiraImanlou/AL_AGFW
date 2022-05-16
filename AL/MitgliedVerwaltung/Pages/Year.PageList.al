page 50236 "Years List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTableView = sorting(Code) order(descending);
    SourceTable = Years;
    Caption = 'Jahr';

    layout
    {
        area(Content)
        {
            repeater("Repeater Year List ")
            {
                ShowCaption = false;
                field(Year; Rec.Code)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}