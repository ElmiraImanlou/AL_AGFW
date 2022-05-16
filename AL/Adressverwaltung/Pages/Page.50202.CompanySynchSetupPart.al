page 50202 "Company Synch. Setup Part"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AM Table Synchronisation Setup";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CompanyName; "Company Name")
                {
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
