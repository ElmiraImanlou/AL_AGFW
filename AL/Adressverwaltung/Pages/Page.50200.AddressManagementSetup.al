page 50200 "Address Management Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Address Management Setup";

    layout
    {
        area(Content)
        {
            group(DoubleCheck)
            {
                CaptionML = DEU = 'Dublettenprüfung';
                field(PhoneticAlgorithm; Rec."Phonetic Algorithm")
                {
                    ApplicationArea = All;
                }
            }
            group(Synchronisation)
            {
                field(SynchContacts; Rec."Synch. Contacts")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit();
                    var
                        SynchSetup: Record "AM Table Synchronisation Setup";
                    begin
                        Rec.Validate("Synch. Contacts", Rec."Synch. Contacts"::SomeCompanies);
                        CurrPage.SaveRecord();
                        Commit();
                        SynchSetup.SetRange("Table No.", Database::COntact);
                        Page.RunModal(Page::"AM Synchronisation Setup", SynchSetup);
                    end;
                }
                field(SynchContactCategories; Rec."Synch. Contact Categories")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit();
                    var
                        SynchSetup: Record "AM Table Synchronisation Setup";
                    begin
                        Rec.Validate("Synch. Contact Categories", Rec."Synch. Contact Categories"::SomeCompanies);
                        CurrPage.SaveRecord();
                        Commit();
                        SynchSetup.SetFilter("Table No.", '%1|%2', Database::"Contact Category", Database::"Contact Category Assignment");
                        Page.RunModal(Page::"AM Synchronisation Setup", SynchSetup);
                    end;
                }
                field(SynchAddresses; Rec."Synch. Addresses")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit();
                    var
                        SynchSetup: Record "AM Table Synchronisation Setup";
                    begin
                        Rec.Validate("Synch. Addresses", Rec."Synch. Addresses"::SomeCompanies);
                        CurrPage.SaveRecord();
                        Commit();
                        SynchSetup.SetFilter("Table No.", '%1|%2', Database::"Address Type", Database::"Contact Address");
                        Page.RunModal(Page::"AM Synchronisation Setup", SynchSetup);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Deputies)
            {
                CaptionML = DEU = 'Stellvertreter';
                ApplicationArea = All;
                Image = User;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                RunObject = Page "AM User Deputies";

            }
        }
    }

    var
        myInt: Integer;

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Insert();
    end;
}
