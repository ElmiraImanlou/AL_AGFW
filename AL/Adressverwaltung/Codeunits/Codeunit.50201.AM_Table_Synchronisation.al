codeunit 50201 "AM Table Synchronisation"
{
    SingleInstance = true;

    trigger OnRun()
    var
        SynchEntry: Record "AM Synchcronisation Entry";
        SynchMode: Option Insert,Modify,Rename,Delete;
        SourceRecRef: RecordRef;
        DestRecRef: RecordRef;
        OutStr: OutStream;
    begin
        RunningSynchronisation := true;

        SynchEntry.SetRange("Destination Company", CompanyName);
        SynchEntry.SetRange("Synchronisation Done", CreateDateTime(0D, 0T));
        if SynchEntry.FindSet(true, false) then
            repeat
                case SynchEntry."Synchronisation Mode" of
                    SynchMode::Rename:
                        begin
                            if DestRecRef.Get(SynchEntry."x Record ID") then begin
                                SynchEntry.Success := DestRecRef.Delete(true);
                                DestRecRef.Close();
                            end else
                                SynchEntry.Success := true;

                            SourceRecRef.Open(SynchEntry."Table No.", false, SynchEntry."Source Company");
                            SourceRecRef.Get(SynchEntry."Record ID");
                            DestRecRef.Open(SynchEntry."Table No.");
                            DestRecRef.Copy(SourceRecRef);
                            SynchEntry.Success := DestRecRef.Insert(true);

                            SourceRecRef.Close();
                            DestRecRef.Close();
                        end;
                    SynchMode::Delete:
                        begin
                            if DestRecRef.Get(SynchEntry."Record ID") then begin
                                SynchEntry.Success := DestRecRef.Delete(true);
                                DestRecRef.Close();
                            end else
                                SynchEntry.Success := true;
                        end;
                    SynchMode::Insert:
                        begin
                            SourceRecRef.Open(SynchEntry."Table No.", false, SynchEntry."Source Company");
                            SourceRecRef.Get(SynchEntry."Record ID");
                            DestRecRef.Open(SynchEntry."Table No.");
                            DestRecRef.Copy(SourceRecRef);
                            SynchEntry.Success := DestRecRef.Insert(true);

                            SourceRecRef.Close();
                            DestRecRef.Close();
                        end;
                    SynchMode::Modify:
                        begin
                            SourceRecRef.Open(SynchEntry."Table No.", false, SynchEntry."Source Company");
                            SourceRecRef.Get(SynchEntry."Record ID");
                            DestRecRef.Open(SynchEntry."Table No.");
                            DestRecRef.Copy(SourceRecRef);
                            case true of
                                DestRecRef.Modify(true):
                                    SynchEntry.Success := true;
                                DestRecRef.Insert(true):
                                    SynchEntry.Success := true;
                                else
                                    SynchEntry.Success := false;
                            end;

                            SourceRecRef.Close();
                            DestRecRef.Close();
                        end;
                end;

                if not SynchEntry.Success then begin
                    SynchEntry."Error Message".CREATEOUTSTREAM(OutStr);
                    OutStr.Write(GetLastErrorText());
                    Clear(OutStr);
                end;
                SynchEntry."Synchronisation Done" := CurrentDateTime;
                SynchEntry.Modify(true);
            until SynchEntry.Next() = 0
        else
            error('SynchEntry not found.');
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // EVENT SUBSCRIBERS
    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 5050: Contact
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterInsertEvent', '', true, false)]
    local procedure Contact_OnAfterInsert(var Rec: Record Contact; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Insert);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterModifyEvent', '', true, false)]
    local procedure Contact_OnAfterModify(var Rec: Record Contact; var xRec: Record Contact; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(xRec, Rec, SynchMode::Modify);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterRenameEvent', '', true, false)]
    local procedure Contact_OnAfterRename(var Rec: Record Contact; var xRec: Record Contact; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(xRec, Rec, SynchMode::Rename);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterDeleteEvent', '', true, false)]
    local procedure Contact_OnAfterDelete(var Rec: Record Contact; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Delete);
        AddressManagement.ProceedSynchronisation(true);
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50210: Contact Category
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Contact Category", 'OnAfterInsertEvent', '', true, false)]
    local procedure ContactCategory_OnAfterInsert(var Rec: Record "Contact Category"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Insert);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category", 'OnAfterModifyEvent', '', true, false)]
    local procedure ContactCategory_OnAfterModify(var Rec: Record "Contact Category"; var xRec: Record "Contact Category"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Modify);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category", 'OnAfterRenameEvent', '', true, false)]
    local procedure ContactCategory_OnAfterRename(var Rec: Record "Contact Category"; var xRec: Record "Contact Category"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Rename);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category", 'OnAfterDeleteEvent', '', true, false)]
    local procedure ContactCategory_OnAfterDelete(var Rec: Record "Contact Category"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Delete);
        AddressManagement.ProceedSynchronisation(true);
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50210: Contact Category Assignment
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Contact Category Assignment", 'OnAfterInsertEvent', '', true, false)]
    local procedure ContactCategoryAssignment_OnAfterInsert(var Rec: Record "Contact Category Assignment"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Insert);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category Assignment", 'OnAfterModifyEvent', '', true, false)]
    local procedure ContactCategoryAssignment_OnAfterModify(var Rec: Record "Contact Category Assignment"; var xRec: Record "Contact Category Assignment"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Modify);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category Assignment", 'OnAfterRenameEvent', '', true, false)]
    local procedure ContactCategoryAssignment_OnAfterRename(var Rec: Record "Contact Category Assignment"; var xRec: Record "Contact Category Assignment"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Rename);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category Assignment", 'OnAfterDeleteEvent', '', true, false)]
    local procedure ContactCategoryAssignment_OnAfterDelete(var Rec: Record "Contact Category Assignment"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Delete);
        AddressManagement.ProceedSynchronisation(true);
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50212: Contact Address
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Contact Address", 'OnAfterInsertEvent', '', true, false)]
    local procedure ContactAddress_OnAfterInsert(var Rec: Record "Contact Address"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Insert);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Address", 'OnAfterModifyEvent', '', true, false)]
    local procedure ContactAddress_OnAfterModify(var Rec: Record "Contact Address"; var xRec: Record "Contact Address"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Modify);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Address", 'OnAfterRenameEvent', '', true, false)]
    local procedure ContactAddress_OnAfterRename(var Rec: Record "Contact Address"; var xRec: Record "Contact Address"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Rename);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Address", 'OnAfterDeleteEvent', '', true, false)]
    local procedure ContactAddress_OnAfterDelete(var Rec: Record "Contact Address"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Delete);
        AddressManagement.ProceedSynchronisation(true);
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50213: Address Type
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Address Type", 'OnAfterInsertEvent', '', true, false)]
    local procedure AddressType_OnAfterInsert(var Rec: Record "Address Type"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Insert);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Address Type", 'OnAfterModifyEvent', '', true, false)]
    local procedure AddressType_OnAfterModify(var Rec: Record "Address Type"; var xRec: Record "Address Type"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Modify);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Address Type", 'OnAfterRenameEvent', '', true, false)]
    local procedure AddressType_OnAfterRename(var Rec: Record "Address Type"; var xRec: Record "Address Type"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, xRec, SynchMode::Rename);
        AddressManagement.ProceedSynchronisation(true);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Address Type", 'OnAfterDeleteEvent', '', true, false)]
    local procedure AddressType_OnAfterDelete(var Rec: Record "Address Type"; RunTrigger: Boolean)
    begin
        if RunningSynchronisation then
            exit;
        AddressManagement.CreateSynchronisationEntries(Rec, 0, SynchMode::Delete);
        AddressManagement.ProceedSynchronisation(true);
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // General Subscribers
    ///////////////////////////////////////////////////////////////////////////////////////

    [EventSubscriber(ObjectType::Table, Database::Company, 'OnAfterDeleteEvent', '', true, false)]
    local procedure Company_OnAfterDelete(var Rec: Record Company; RunTrigger: Boolean)
    var
        SynchSetup: Record "AM Table Synchronisation Setup";
    begin
        SynchSetup.SetRange("Company Name", Rec.Name);
        SynchSetup.DeleteAll();
    end;

    var
        AddressManagement: Codeunit "Address Management";
        SynchMode: Option Insert,Modify,Rename,Delete;
        RunningSynchronisation: Boolean;
}