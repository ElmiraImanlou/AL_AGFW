page 50205 "AM Synchcronisation Entries"
{
    PageType = List;
    InsertAllowed = false;
    //ModifyAllowed = false;
    DeleteAllowed = false;
    SourceTable = "AM Synchcronisation Entry";
    PromotedActionCategoriesML = ENU = 'New,Process,Report,Delete', DEU = 'Neu,Vorgang,Bericht,Löschen';

    layout
    {
        area(Content)
        {
            repeater(Entries)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    CaptionML = DEU = 'lfd. Nr.';
                    ApplicationArea = All;
                }
                field("Source Company"; Rec."Source Company")
                {
                    CaptionML = DEU = 'von';
                    ApplicationArea = All;
                }
                field("Destination Company"; Rec."Destination Company")
                {
                    CaptionML = DEU = 'nach';
                    ApplicationArea = All;
                }
                field("Record ID"; Format(Rec."Record ID"))
                {
                    CaptionML = DEU = 'Datensatz';
                    ApplicationArea = All;
                }
                field("Synchronisation Mode"; Rec."Synchronisation Mode")
                {
                    CaptionML = DEU = 'Art';
                    ApplicationArea = All;
                }
                field("Synchronisation Done"; Rec."Synchronisation Done")
                {
                    CaptionML = DEU = 'Abgeschlossen';
                    ApplicationArea = All;
                }
                field(Success; Rec.Success)
                {
                    CaptionML = DEU = 'Erfolgreich';
                    ApplicationArea = All;
                }
                field(ErrorMessage; txtErrorMessage)
                {
                    CaptionML = DEU = 'Fehlermeldung';
                    ApplicationArea = All;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Delete)
            {
                CaptionML = DEU = 'Löschen';
                action(DeleteSuccessfullEntries)
                {

                    CaptionML = DEU = 'Erfolgreiche Synchronisationen';
                    ApplicationArea = All;
                    Image = Delete;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.SetRange(Success, true);
                        Rec.DeleteAll();
                        Rec.Reset();
                        CurrPage.Update(false);
                    end;
                }

                action(DeleteAllEntries)
                {

                    CaptionML = DEU = 'Alle Synchronisationen';
                    ApplicationArea = All;
                    Image = ClearLog;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.DeleteAll();
                        CurrPage.Update(false);
                    end;
                }
            }
            action(ReRun)
            {
                CaptionML = DEU = 'Alle fehlgeschlagenen Synchronisationen wiederholen';
                Promoted = true;
                PromotedIsBig = true;
                Image = ReOpen;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SynchEntry: Record "AM Synchcronisation Entry";
                    AddressMgt: Codeunit "Address Management";
                begin
                    SynchEntry.SetRange(Success, false);
                    SynchEntry.SetFilter("Synchronisation Done", '<>%1', CreateDateTime(0D, 0T));
                    SynchEntry.ModifyAll("Synchronisation Done", CreateDateTime(0D, 0T));
                    Commit();
                    CurrPage.Update(false);
                    AddressMgt.ProceedSynchronisation(true);
                end;
            }
        }
    }


    var
        [InDataSet]
        txtErrorMessage: Text;

    trigger OnAfterGetRecord()
    var
        InStr: InStream;
    begin
        Clear(InStr);
        Clear(txtErrorMessage);
        Rec."Error Message".CreateInStream(InStr);
        InStr.Read(txtErrorMessage);
    end;
}

