page 50204 "AM Salutation"
{
    CaptionML = DEU = 'Adressen / Grußformel';
    SourceTable = "Salutation Text";
    PageType = List;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    PromotedActionCategoriesML = DEU = 'Neu,Vorgang,Bericht,Art';
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(List)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field(Text; Rec.Text)
                {
                    ApplicationArea = All;
                    ToolTipML = DEU = 'Nutzen Sie die folgenden Platzhalter: %1 - Nachname, %2 - Vorname, %3 - akademischer Titel, %4 - Unternehmensname';
                    MultiLine = true;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Address)
            {
                ApplicationArea = All;
                CaptionML = DEU = 'Anschrift';
                Promoted = true;
                PromotedIsBig = true;
                Image = Addresses;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Address);
                    CurrPage.Update(false);
                end;
            }
            action(Salutation)
            {
                ApplicationArea = All;
                CaptionML = DEU = 'Anrede';
                Promoted = true;
                PromotedIsBig = true;
                Image = Addresses;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Salutation);
                    CurrPage.Update(false);
                end;
            }
            action(Closing)
            {
                ApplicationArea = All;
                CaptionML = DEU = 'Schlussformel';
                Promoted = true;
                PromotedIsBig = true;
                Image = Addresses;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Closing);
                    CurrPage.Update(false);
                end;
            }
            action(Invitation)
            {
                ApplicationArea = All;
                CaptionML = DEU = 'Einladung';
                Promoted = true;
                PromotedIsBig = true;
                Image = Addresses;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    SetRange(Type, Type::Invitation);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetRange(Type, Type::Address);
    end;
}
