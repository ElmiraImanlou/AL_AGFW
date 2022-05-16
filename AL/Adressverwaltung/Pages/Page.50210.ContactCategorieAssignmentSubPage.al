page 50210 "Contact Category Ass. SubPage"
{
    Caption = 'Kontakt Kategorie';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Contact Category Assignment";
    SourceTableView = SORTING("Contact No.", "Start Date", "End Date", "Category Code")
                      ORDER(Descending);
    DelayedInsert = true;


    layout
    {
        area(Content)
        {
            repeater("General")
            {


                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Kategorie Code field.';
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
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Kontakt Nr. field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}