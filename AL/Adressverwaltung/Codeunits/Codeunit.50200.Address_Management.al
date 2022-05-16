codeunit 50200 "Address Management"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;

    procedure UpdatePhoneticHash(Contact: Record Contact)
    var
        ProcessDialog: Dialog;
        CountAll: Integer;
        CountDone: Integer;
        PROCESS: TextConst DEU = '%1 von %2', ENU = '%1 of %2';
        UPDATING: TextConst DEU = 'Kontakte werden aktualisiert\ #1#############', ENU = 'Updating Contacts\ #1#############';
    begin
        SelectLatestVersion();
        CountAll := Contact.Count();
        CountDone := 0;
        if GuiAllowed then
            ProcessDialog.Open(UPDATING);

        if Contact.FindSet(true, false) then
            repeat
                Contact."Phonetic Hash (Name)" := PhoneticHash(Contact.Name, true);
                Contact.Modify(false);
                CountDone += 1;
                if GuiAllowed then
                    ProcessDialog.Update(1, StrSubstNo(PROCESS, CountDone, CountAll));
            until Contact.Next() = 0;

        if GuiAllowed then
            ProcessDialog.Close();
    end;

    procedure PhoneticHash(Input: Text; IsName: Boolean) Hash: Text
    var
        InputParts: dotnet Array;
        InputPart: Text;
    begin
        AMSetup.Get();
        if IsName then
            InputParts := Regex.Split(Input, ' |-')
        else
            InputParts := Regex.Split(DELCHR(Input, '=', '-'), ' ');

        foreach InputPart in InputParts do
            if InputPart <> '' then begin
                if Hash <> '' then
                    Hash += ' ';
                case AMSetup."Phonetic Algorithm" of
                    AMSetup."Phonetic Algorithm"::Cologne:
                        Hash += Cologne(InputPart);
                    AMSetup."Phonetic Algorithm"::SoundexENG:
                        Hash += SoundexENG(InputPart);
                    AMSetup."Phonetic Algorithm"::SoundexDEU:
                        Hash += SoundexDEU(InputPart);
                end
            end;

        Hash := CopyStr(Hash, 1, 30);
    end;

    local procedure Cologne(Word: Text) Hash: Text
    begin
        Hash := Word;

        Hash := Regex.Replace(Hash, 'ß', 'ss');
        Hash := Uppercase(Hash);
        Hash := Regex.Replace(Hash, 'Ä', 'A');
        Hash := Regex.Replace(Hash, 'Ö', 'O');
        Hash := Regex.Replace(Hash, 'Ü', 'U');
        Hash := Regex.Replace(Hash, '[^A-Z]', '');

        Hash := Regex.Replace(Hash, '[BP](?=[^H]|$)', '1');
        Hash := Regex.Replace(Hash, '[DT](?=[^CSZ]|$)', '2');
        Hash := Regex.Replace(Hash, '[FVW]', '3');
        Hash := Regex.Replace(Hash, 'P(?=H)', '3');
        Hash := Regex.Replace(Hash, '^C(?=[AHKLOQRUX])', '4');
        Hash := Regex.Replace(Hash, '(?<=[^SZ]|^)C(?=[AHKOQUX]|$)', '4');
        Hash := Regex.Replace(Hash, '(?<=[^CKQ]|^)X', '48');
        Hash := Regex.Replace(Hash, 'C(?=[^AHKOQUX]|$)', '8');
        Hash := Regex.Replace(Hash, '(?<=[SZ])C', '8');

        Hash := Regex.Replace(Hash, '[AEIJOUYÄÖÜ]', '0');
        Hash := Regex.Replace(Hash, '[GKQ]', '4');
        Hash := Regex.Replace(Hash, 'L', '5');
        Hash := Regex.Replace(Hash, '[MN]', '6');
        Hash := Regex.Replace(Hash, 'R', '7');

        Hash := Regex.Replace(Hash, '[SZ]', '8');
        Hash := Regex.Replace(Hash, '^C', '8');
        Hash := Regex.Replace(Hash, '[DT]', '8');
        Hash := Regex.Replace(Hash, 'X', '8');

        Hash := Regex.Replace(Hash, 'H', '');

        Hash := Regex.Replace(Hash, '(\d)(?=\1)', '');
        Hash := Regex.Replace(Hash, '(?<=\d)0', '');
    end;

    local procedure SoundexENG(Word: Text) Hash: Text
    begin
        Hash := Word;

        Hash := Regex.Replace(Hash, 'ß', 's');
        Hash := Uppercase(Hash);
        Hash := Regex.Replace(Hash, '[ÄÖÜ]', '');
        Hash := Regex.Replace(Hash, '[^A-Z]', '');

        Hash := Regex.Replace(Hash, '(?<=[\w])[BFPV]', '1');
        Hash := Regex.Replace(Hash, '(?<=[\w])[CGJKQSXZ]', '2');
        Hash := Regex.Replace(Hash, '(?<=[\w])[DT]', '3');
        Hash := Regex.Replace(Hash, '(?<=[\w])[L]', '4');
        Hash := Regex.Replace(Hash, '(?<=[\w])[MN]', '5');
        Hash := Regex.Replace(Hash, '(?<=[\w])[R]', '6');
        Hash := Regex.Replace(Hash, '(?<=[\w])[AEIOUHWY]', '');

        Hash := Regex.Replace(Hash, '0', '');
        Hash := Regex.Replace(Hash, '(\d)(?=\1)', '');

        Hash := CopyStr(Hash, 1, 4);
        while StrLen(Hash) < 4 do
            Hash += '0';
    end;

    local procedure SoundexDEU(Word: Text) Hash: Text
    begin
        Hash := Word;

        Hash := Regex.Replace(Hash, 'ß', 's');
        Hash := Uppercase(Hash);
        Hash := Regex.Replace(Hash, '[ÄÖÜ]', '');
        Hash := Regex.Replace(Hash, '[^A-Z]', '');

        Hash := Regex.Replace(Hash, '(?<=[\w])CH', '7');
        Hash := Regex.Replace(Hash, '(?<=[\w])[AEIOUÄÖÜYJH]', '0');
        Hash := Regex.Replace(Hash, '(?<=[\w])[BFPVW]', '1');
        Hash := Regex.Replace(Hash, '(?<=[\w])[CGKQXSZ]', '2');
        Hash := Regex.Replace(Hash, '(?<=[\w])[DT]', '3');
        Hash := Regex.Replace(Hash, '(?<=[\w])[L]', '4');
        Hash := Regex.Replace(Hash, '(?<=[\w])[MN]', '5');
        Hash := Regex.Replace(Hash, '(?<=[\w])[R]', '6');

        Hash := Regex.Replace(Hash, '0', '');
        Hash := Regex.Replace(Hash, '(\d)(?=\1)', '');

        Hash := CopyStr(Hash, 1, 4);
        while StrLen(Hash) < 4 do
            Hash += '0';
    end;

    procedure CreateSynchronisationEntries(Rec: Variant; xRec: Variant; SynchMode: Option Insert,Modify,Rename,Delete)
    var
        AMSetup: Record "Address Management Setup";
        SynchEntry: Record "AM Synchcronisation Entry";
        AMSynchSetup: Record "AM Table Synchronisation Setup";
        Company: Record Company;
        RecRef: RecordRef;
        xRecRef: RecordRef;
        TableNo: Integer;
        SetupMode: Option None,AllCompanies,SomeCompanies;
    begin
        AMSetup.Get();
        AMSetup.GetSynchSetup(Rec, TableNo, SetupMode, AMSynchSetup);
        if SetupMode = SetupMode::None then
            exit;

        Company.SetFilter(Name, '<>%1', CompanyName);
        if Company.FindSet(false) then
            repeat
                SynchEntry.Init();
                CLEAR(SynchEntry."Entry No.");
                SynchEntry."Source Company" := CompanyName;
                SynchEntry."Destination Company" := Company.Name;
                SynchEntry."Synchronisation Mode" := SynchMode;
                SynchEntry."Table No." := TableNo;
                case SynchMode of
                    SynchMode::Insert:
                        SynchEntry."Record ID" := GetRecordIdFromVariant(Rec);
                    SynchMode::Modify:
                        SynchEntry."Record ID" := GetRecordIdFromVariant(Rec);
                    SynchMode::Rename:
                        begin
                            SynchEntry."Record ID" := GetRecordIdFromVariant(Rec);
                            SynchEntry."x Record ID" := GetRecordIdFromVariant(xRec);
                        end;
                    SynchMode::Delete:
                        SynchEntry."Record ID" := GetRecordIdFromVariant(Rec);
                end;
                AMSynchSetup.SetRange("Company Name", Company.Name);
                if (SetupMode = SetupMode::AllCompanies) or AMSynchSetup.FindFirst() then
                    SynchEntry.Insert(true);
            until Company.Next() = 0;
    end;

    procedure ProceedSynchronisation(SkipCurrCompany: Boolean)
    var
        Company: Record Company;
        SessionId: Integer;
    begin
        if SkipCurrCompany then
            Company.SetFilter(Name, '<>%1', CompanyName);
        If Company.FindSet(false) then
            repeat
                if not Session.StartSession(SessionId, Codeunit::"AM Table Synchronisation", Company.Name) then
                    Error(GetLastErrorText());
            until Company.Next() = 0;
    end;

    procedure GetRecRefFromVariant(Source: Variant; var TableNo: Integer) RecRef: RecordRef
    begin
        case true of
            Source.IsRecord:
                RecRef.GetTable(Source);
            Source.IsRecordId:
                RecRef.Get(Source);
            Source.IsRecordRef:
                RecRef := Source;
            else
                Error('"Address Management".GetRecRefFromVariant ( CU 50200 ): Type of Parameter Source must be Record, RecordId or RecordRef');
        end;
        TableNo := RecRef.Number;
    end;

    procedure GetRecordIdFromVariant(Source: Variant) RecId: RecordId
    var
        SourceRecRef: RecordRef;
        TableNo: Integer;
    begin
        SourceRecRef := GetRecRefFromVariant(Source, TableNo);
        RecId := SourceRecRef.RecordId;
        SourceRecRef.Close();
    end;

    local procedure DoubleCheck(var Rec: Record Contact)
    var
        Contact: Record Contact;
    begin
        // if Rec."Phonetic Hash (Name)" = '' then
        //     Rec."Phonetic Hash (Name)" := PhoneticHash(Rec.Name, true);
        // Contact.SetRange("Phonetic Hash (Name)", Rec."Phonetic Hash (Name)");
        // if Contact.Count = 0 then
        //     exit;
        // if Page.RunModal(Page::"Double Check Contact List", Contact) = Action::LookupOK then begin
        //     Rec.Get(Contact."No.");
        // end;
    end;

    local procedure EditContactAllowed(ContactAsVariant: Variant) Ok: Boolean
    var
        AMUserDeputy: Record "AM User Deputy";
        Contact: Record Contact;
        ContactRecRef: RecordRef;
    begin
        case true of
            ContactAsVariant.IsRecord:
                Contact := ContactAsVariant;
            ContactAsVariant.IsRecordId:
                Contact.Get(ContactAsVariant);
            ContactAsVariant.IsRecordRef:
                begin
                    ContactRecRef := ContactAsVariant;
                    Contact.Get(ContactRecRef.RecordId);
                end;
            ContactAsVariant.IsCode:
                Contact.Get(ContactAsVariant);
        end;

        if Contact."Assigned User" = UserId then
            exit(true);

        AMUserDeputy.SetFilter("User Name", '%1|%2', '', Contact."Assigned User");
        AMUserDeputy.SetRange("Deputy User Name", UserId);
        AMUserDeputy.SetRange("From Date", 0D, Today());
        AMUserDeputy.SetFilter("To Date", '%1..|%2', Today(), 0D);
        AMUserDeputy.SetRange(Active, true);
        AMUserDeputy.SetRange("Contact Editing", true);
        exit(not AMUserDeputy.IsEmpty());
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Address Formatting functions
    ///////////////////////////////////////////////////////////////////////////////////////
    procedure ContactFormatAddress(Contact: Record Contact) Address: Text
    var
        Salutation: Record Salutation;
        FormatAddress: Codeunit "Format Address";
        i: Integer;
        AddressArr: array[8] of Text[100];
    begin
        if not Salutation.Get(Contact."Salutation Code") then begin
            FormatAddress.ContactAddr(AddressArr, Contact);
            for i := 1 to 8 do
                if AddressArr[i] <> '' then begin
                    if Address <> '' then
                        Address[StrLen(Address) + 1] := 10;
                    Address += Address[i];
                end;
        end else begin
            Address := Strsubstno(Salutation.Address, Contact.Surname, Contact."First Name", Contact."Academic Degree", Contact."Company Name");
            Address[StrLen(Address) + 1] := 10;
            Address += Contact.Address;
            Address[StrLen(Address) + 1] := 10;
            Address += Contact."Address 2";
            Address[StrLen(Address) + 1] := 10;
            Address += StrSubstNo('%1 %2', Contact."Post Code", Contact.City);
        end;

        Address := Regex.Replace(Address, '  ', ' ');
        Address := Regex.Replace(Address, '[\r\n](?=[\r\n])', '');
    end;

    procedure ContactFormatSalutation(Contact: Record Contact) SalutationText: Text
    var
        Salutation: Record Salutation;
    begin
        if not Salutation.Get(Contact."Salutation Code") then
            exit('');

        exit(Regex.Replace(StrSubstNo(Salutation.Salutation, Contact.Surname, Contact."First Name", Contact."Academic Degree", Contact."Company Name"), '  ', ' '));
    end;

    procedure ContactFormatClosing(Contact: Record Contact) ClosingText: Text
    var
        Salutation: Record Salutation;
    begin
        if not Salutation.Get(Contact."Salutation Code") then
            exit('');

        exit(Regex.Replace(StrSubstNo(Salutation.Closing, Contact.Surname, Contact."First Name", Contact."Academic Degree", Contact."Company Name"), '  ', ' '));
    end;

    procedure ContactFormatInvitation(Contact: Record Contact) InvitationText: Text
    var
        Salutation: Record Salutation;
    begin
        if not Salutation.Get(Contact."Salutation Code") then
            exit('');

        exit(Regex.Replace(StrSubstNo(Salutation.Invitation, Contact.Surname, Contact."First Name", Contact."Academic Degree", Contact."Company Name"), '  ', ' '));

    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // EVENT SUBSCRIBERS
    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 5050: Contact
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterValidateEvent', 'Name', true, false)]
    local procedure Contact_OnAfterValidateName(var Rec: Record Contact; var xRec: Record Contact; CurrFieldNo: Integer)
    begin
        Rec."Phonetic Hash (Name)" := PhoneticHash(Rec.Name, true);
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnBeforeInsertEvent', '', true, false)]
    local procedure Contact_OnBeforeInsert(var Rec: Record Contact; RunTrigger: Boolean)
    begin
        Rec."Assigned User" := UserId();
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnBeforeModifyEvent', '', true, false)]
    local procedure Contact_OnBeforeModify(var Rec: Record Contact; var xRec: Record Contact; RunTrigger: Boolean)
    var
        CONTACTEDITING_NOT_ALLOWED: TextConst DEU = 'Sie dürfen diesen Kontakt nicht bearbeiten.', ENU = 'Your not allowed to edit this Contact.';
    begin
        if xRec."Assigned User" = '' then
            exit;
        if not EditContactAllowed(xRec) then
            Error(CONTACTEDITING_NOT_ALLOWED);
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50200: "Address Management Setup"
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Address Management Setup", 'OnAfterModifyEvent', '', true, false)]
    local procedure AddressManagementSetup_OnAfterModify(var Rec: Record "Address Management Setup"; var xRec: Record "Address Management Setup"; RunTrigger: Boolean);
    var
        Contact: Record Contact;
        AddressMgt: Codeunit "Address Management";
        UPDATE_PHONETIC_HASH: TextConst DEU = 'Der Phonetik-Algorithmus wurde geändert. Es sollten die Hash-Werte aller Kontakte neu erzeugt werden. Dies kann je nach Anzahl der Kontakte sehr lange dauern.\ Soll der Vorgang jetzt gestartet werden?',
                                        ENU = 'The Phonetic algorithm has been changed. Hash values of all contact should be updated. This can take a long time, accortding to the total number of contacts. Do you want to start this process?';
    begin
        if xRec."Phonetic Algorithm" <> Rec."Phonetic Algorithm" then
            if Confirm(UPDATE_PHONETIC_HASH) then begin
                Commit();
                UpdatePhoneticHash(Contact);
            end else
                Error('');
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50211: Contact Category Assignment
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Contact Category Assignment", 'OnBeforeInsertEvent', '', true, false)]
    local procedure ContactCategoryAssignment_OnBeforeInsert(var Rec: Record "Contact Category Assignment"; RunTrigger: Boolean)
    var
        CONTACTEDITING_NOT_ALLOWED: TextConst DEU = 'Sie dürfen keine Kontaktkategorien des Kontaktes %1 erstellen.', ENU = 'Your not allowed to insert contact categories of contact %1.';
    begin
        Rec.TestField("Contact No.");
        if not (EditContactAllowed(Rec."Contact No.")) then
            Error(CONTACTEDITING_NOT_ALLOWED, Rec."Contact No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Category Assignment", 'OnBeforeModifyEvent', '', true, false)]
    local procedure ContactCategoryAssignment_OnBeforeModify(var Rec: Record "Contact Category Assignment"; var xRec: Record "Contact Category Assignment"; RunTrigger: Boolean)
    var
        CONTACTEDITING_NOT_ALLOWED: TextConst DEU = 'Sie dürfen Kontaktkategorien des Kontakts %1 nicht bearbeiten.', ENU = 'Your not allowed to edit contact categories of contact %1.';
    begin
        Rec.TestField("Contact No.");
        if not (EditContactAllowed(xRec."Contact No.")) then
            Error(CONTACTEDITING_NOT_ALLOWED, xRec."Contact No.");
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Table 50212: Contact Address
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Table, Database::"Contact Address", 'OnBeforeInsertEvent', '', true, false)]
    local procedure ContactAddress_OnBeforeInsert(var Rec: Record "Contact Address"; RunTrigger: Boolean)
    var
        CONTACTEDITING_NOT_ALLOWED: TextConst DEU = 'Sie dürfen keine Adressen des Kontaktes %1 erstellen.', ENU = 'Your not allowed to insert addresses of contact %1.';
    begin
        Rec.TestField("Contact No.");
        if not (EditContactAllowed(Rec."Contact No.")) then
            Error(CONTACTEDITING_NOT_ALLOWED, Rec."Contact No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Contact Address", 'OnBeforeModifyEvent', '', true, false)]
    local procedure ContactAddress_OnBeforeModify(var Rec: Record "Contact Address"; var xRec: Record "Contact Address"; RunTrigger: Boolean)
    var
        CONTACTEDITING_NOT_ALLOWED: TextConst DEU = 'Sie dürfen Adressen des Kontakts %1 nicht bearbeiten.', ENU = 'Your not allowed to edit addresses of contact %1.';
    begin
        Rec.TestField("Contact No.");
        if not (EditContactAllowed(xRec."Contact No.")) then
            Error(CONTACTEDITING_NOT_ALLOWED, xRec."Contact No.");
    end;

    ///////////////////////////////////////////////////////////////////////////////////////
    // Page 5050: Contact Card
    ///////////////////////////////////////////////////////////////////////////////////////
    [EventSubscriber(ObjectType::Page, Page::"Contact Card", 'OnNewRecordEvent', '', true, false)]
    local procedure ContactCard_OnNewRecord(var Rec: Record Contact; BelowxRec: Boolean; var xRec: Record Contact)
    var
        Contact: Record Contact;
        NewContactPage: Page "Contact Insert And Dbl Check";
    begin
        Contact.Init();
        NewContactPage.SetRecord(Contact);
        NewContactPage.Editable(true);
        // NewContactPage.LookupMode(true);//eli
        // if NewContactPage.RunModal = Action::LookupOK::OK then begin//If Ok create new Contact eli
        NewContactPage.RunModal();
        Contact := NewContactPage.getSelectedRecord();
        if Contact."No." = '' then begin
            Contact.Insert(true);
            Commit();
        end;
        Page.Run(Page::"Contact Card", Contact);
        // end else//eli
        // ;
        Error('');
    end;

    var
        AMSetup: Record "Address Management Setup";
        Regex: DotNet Regex;
}