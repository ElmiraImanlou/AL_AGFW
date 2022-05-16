page 50203 "Contact Insert And Dbl Check"
{
    PageType = ListPlus;
    CaptionML = DEU = 'Neuer Kontakt';
    SourceTable = Contact;
    SourceTableView = where("Phonetic Hash (Name)" = filter(<> ''));
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(NewContact)
            {
                ShowCaption = false;
                field(Type; newContact.Type)
                {
                    CaptionML = DEU = 'Art';


                    trigger OnValidate()
                    begin
                        isPerson := newContact.Type = newContact.Type::Person;
                        CurrPage.Update(true);
                    end;
                }
                group(Name)
                {
                    CaptionML = DEU = 'Name';
                    grid(PersonName)
                    {
                        field(newFirstName; newContact."First Name")
                        {
                            CaptionML = DEU = 'Vorname';
                            ApplicationArea = All;
                            ShowCaption = false;
                            Enabled = isPerson;

                            trigger OnValidate()
                            begin
                                ValidateName();
                            end;
                        }
                        field(newSurname; newContact.Surname)
                        {
                            CaptionML = DEU = 'Nachname';
                            ApplicationArea = All;
                            ShowCaption = false;
                            Enabled = isPerson;

                            trigger OnValidate()
                            begin
                                ValidateName();
                            end;
                        }
                    }
                    field(newName; newContact.Name)
                    {
                        CaptionML = DEU = 'Name';
                        ShowCaption = false;

                        trigger OnValidate()
                        begin
                            ValidateName();
                        end;
                    }

                }
                group(newAddress)
                {
                    CaptionML = DEU = 'Adresse';
                    field(newStreet; newContact.Address)
                    {
                        CaptionML = DEU = 'Straße';
                    }
                    field(newCountryCode; newContact."Country/Region Code")
                    {
                        CaptionML = DEU = 'Ländercode';
                    }
                    field(newPostCode; newContact."Post Code")
                    {
                        CaptionML = DEU = 'PLZ';
                    }
                    field(newCity; newContact.City)
                    {
                        CaptionML = DEU = 'Ort';
                    }
                }
                group(newCommunication)
                {
                    CaptionML = DEU = 'Kommunikation';
                    field("E-Mail"; newContact."E-Mail")
                    {
                        CaptionML = DEU = 'E-Mail';
                    }
                    field("Phone No."; newContact."Phone No.")
                    {
                        CaptionML = DEU = 'Telefon';
                    }
                    field("Mobile Phone No."; newContact."Mobile Phone No.")
                    {
                        CaptionML = DEU = 'Mobil';
                    }
                }
            }
            repeater(Doubles)
            {
                CaptionML = DEU = 'Bereits vorhandene Kontakte';
                field(No; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(selected; Selected)
                {
                    ShowCaption = false;
                    trigger OnValidate()
                    begin
                        newContact := Rec;
                        CurrPage.Close();
                    end;
                }
                field(dblName; getName())
                {
                    CaptionML = DEU = 'Name';
                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = false;
                }
                field(dblAddress; getAddress())
                {
                    CaptionML = DEU = 'Adresse';
                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = false;
                }
                field(dblCommunication; getCommunicationData())
                {
                    CaptionML = DEU = 'E-Mail / Telefon / Mobil';
                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = false;
                }
            }
        }
    }

    var
        AddressMgt: Codeunit "Address Management";
        CRLF: Text;
        newContact: Record Contact temporary;
        isPerson: Boolean;

        [InDataset]
        Selected: Boolean;

    trigger OnOpenPage()
    begin


        CRLF[1] := 10;

        Rec.FilterGroup(7);
        Rec.SetFilter("Phonetic Hash (Name)", '%1&<>%1', '');
        Rec.FilterGroup(0);
    end;

    trigger OnAfterGetRecord()
    begin
        Selected := Rec."No." = newContact."No.";
    end;

    local procedure ValidateName()
    begin
        if (newContact."First Name" <> '') or (newContact.Surname <> '') then
            newContact.Name := StrSubstNo('%1 %2', newContact."First Name", newContact.Surname);
        newContact."Phonetic Hash (Name)" := AddressMgt.PhoneticHash(newContact.Name, true);
        Rec.FilterGroup(7);
        Rec.SetRange("Phonetic Hash (Name)", newContact."Phonetic Hash (Name)");
        Rec.FilterGroup(0);
        CurrPage.Update(true);
    end;

    local procedure getName() NameData: Text
    begin
        NameData := Name;
        if Rec."Name 2" <> '' then begin
            if NameData <> '' then
                NameData += CRLF;
            NameData += Rec."Name 2";
        end;
    end;

    local procedure getAddress() AddressData: Text
    begin
        AddressData := Rec.Address;
        if Rec."Address 2" <> '' then begin
            if AddressData <> '' then
                AddressData += CRLF;
            AddressData += Rec."Address 2";
        end;
        if AddressData <> '' then
            AddressData += CRLF;
        AddressData += DelChr(StrSubstNo('%1 %2', Rec."Post Code", Rec.City), '<>', ' ');
    end;

    local procedure getCommunicationData() CommData: Text
    var
    begin
        if Rec."E-Mail" <> '' then
            CommData := StrSubstNo('%1: %2', Rec.FieldCaption("E-Mail"), Rec."E-Mail");
        if Rec."Phone No." <> '' then begin
            if CommData <> '' then
                CommData += CRLF;
            CommData += StrSubstNo('%1: %2', Rec.FieldCaption("Phone No."), Rec."Phone No.");
        end;
        if Rec."Mobile Phone No." <> '' then begin
            if CommData <> '' then
                CommData += CRLF;
            CommData += StrSubstNo('%1: %2', Rec.FieldCaption("Mobile Phone No."), Rec."Mobile Phone No.");
        end;
    end;

    procedure getSelectedRecord(): Record Contact
    begin
        exit(newContact);
    end;
}