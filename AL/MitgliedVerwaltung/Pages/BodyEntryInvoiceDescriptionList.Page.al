page 50300 "Body Entry Invoice Description"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Body Entry Invoice Description";
    SourceTableView = sorting(ItemNo, LineNo, ItemDescription, MemberType, TextBody);

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ItemNo; Rec.ItemNo)
                {
                    ToolTip = 'Specifies the value of the Artikel Nr. field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Item: Record Item;
                    begin

                        Item.Get(ItemNo);
                        ItemDescription := Item.Description;
                    end;

                }
                field(ItemDescription; Rec.ItemDescription)
                {
                    ToolTip = 'Specifies the value of the Artikel Beschreibung field.';
                    ApplicationArea = All;
                }
                field(LineNo; Rec.LineNo)
                {
                    ToolTip = 'Specifies the value of the LineNo field.';
                    ApplicationArea = All;
                }
                field(MemberType; Rec.MemberType)
                {
                    ToolTip = 'Specifies the value of the MemberType field.';
                    ApplicationArea = All;
                }
                field(TextBody; Rec.TextBody)
                {
                    ToolTip = 'Specifies the value of the TextBody field.';
                    ApplicationArea = All;
                }
                field(TextPosition; Rec.TextPosition)
                {
                    ToolTip = 'Specifies the value of the TextPosition field.';
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
        ItemDescription: text[100];
}