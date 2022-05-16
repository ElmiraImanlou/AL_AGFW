page 50227 "Group Type List"
{
    Caption = 'Gruppen List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTableView = sorting(Description);
    SourceTable = "Group Type";


    layout
    {
        area(Content)
        {
            repeater("Categories")
            {
                ShowCaption = false;


                // field("Code"; Rec."Code")
                // {
                //     ToolTip = 'Specifies the value of the Code field.';
                //     ApplicationArea = All;
                // }
                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Kategorie Code field.';
                    ApplicationArea = All;
                    // TableRelation = "Category Type".Description where("Group Code" = field(Code));
                    TableRelation = "Category Type".Description;
                }
                field(Description; Rec.Description)
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