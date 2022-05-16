page 50228 "Partner Group List"
{
    Caption = 'Gruppen';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTableView = sorting("No.");
    SourceTable = "Partner Group";

    layout
    {
        area(Content)
        {
            repeater(Categories)
            {
                // field("No."; Rec."No.")
                // {
                //     ToolTip = 'Specifies the value of the Code field.';
                //     ApplicationArea = All;
                // }
                field("Category Code"; Rec."Category Code")
                {
                    ToolTip = 'Specifies the value of the Kategorie field.';
                    ApplicationArea = All;
                }
                // field("Category Description"; Rec."Category Description")
                // {
                //     ToolTip = 'Specifies the value of the Category Description field.';
                //     ApplicationArea = All;

                // }
                field("Group Code"; Rec."Group Code")
                {
                    ToolTip = 'Specifies the value of the Gruppe field.';
                    ApplicationArea = All;
                    // TableRelation = "Group Type".Description where("Category Code" = field("Category Code"));
                    TableRelation = "Group Type".Description where("Category Code" = field("Category Code"));
                }

            }
        }
    }

}