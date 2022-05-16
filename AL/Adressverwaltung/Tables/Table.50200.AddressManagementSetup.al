table 50200 "Address Management Setup"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    CaptionML = DEU = 'Adressverwaltung Einrichtung';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Phonetic Algorithm"; Option)
        {
            CaptionML = DEU = 'Phonetik-Algorithmus';
            OptionMembers = Cologne,SoundexDEU,SoundexENG;
            OptionCaptionML = DEU = 'Kölner Phonetik,SOUNDEX (Deutsch),SOUNDEX (Englisch)';
        }
        field(10; "Synch. Contacts"; Option)
        {
            CaptionML = DEU = 'Kontakte synchronisieren';
            OptionMembers = None,AllCompanies,SomeCompanies;
            OptionCaptionML = DEU = ' ,Alle Mandanten,Ausgewählte Mandanten';

            trigger OnValidate()
            var
                SynchSetup: Record "AM Table Synchronisation Setup";
            begin
                SynchSetup.SetRange("Table No.", Database::Contact);
                case Rec."Synch. Contacts" of
                    Rec."Synch. Contacts"::AllCompanies:
                        SynchSetup.DeleteAll();
                    Rec."Synch. Contacts"::None:
                        SynchSetup.DeleteAll();
                end;
            end;
        }
        field(11; "Synch. Contact Categories"; Option)
        {
            CaptionML = DEU = 'Kontaktkategorien synchronisieren';
            OptionMembers = None,AllCompanies,SomeCompanies;
            OptionCaptionML = DEU = ' ,Alle Mandanten,Ausgewählte Mandanten';

            trigger OnValidate()
            var
                SynchSetup: Record "AM Table Synchronisation Setup";
            begin
                SynchSetup.SetFilter("Table No.", '%1|%2', Database::"Contact Category", Database::"Contact Category Assignment");
                case Rec."Synch. Contacts" of
                    Rec."Synch. Contacts"::AllCompanies:
                        SynchSetup.DeleteAll();
                    Rec."Synch. Contacts"::None:
                        SynchSetup.DeleteAll();
                end;
            end;
        }
        field(12; "Synch. Addresses"; Option)
        {
            CaptionML = DEU = 'Adressen synchronisieren';
            OptionMembers = None,AllCompanies,SomeCompanies;
            OptionCaptionML = DEU = ' ,Alle Mandanten,Ausgewählte Mandanten';

            trigger OnValidate()
            var
                SynchSetup: Record "AM Table Synchronisation Setup";
            begin
                SynchSetup.SetFilter("Table No.", '%1|%2', Database::"Address Type", Database::"Contact Address");
                case Rec."Synch. Contacts" of
                    Rec."Synch. Contacts"::AllCompanies:
                        SynchSetup.DeleteAll();
                    Rec."Synch. Contacts"::None:
                        SynchSetup.DeleteAll();
                end;
            end;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure GetSynchSetup(var RecToSynch: Variant; var TableNo: Integer; var SetupMode: Option None,AllCompanies,SomeCompanies; var SynchSetup: Record "AM Table Synchronisation Setup")
    var
        AddressManagement: Codeunit "Address Management";
        RecRefToSynch: RecordRef;
    begin
        RecRefToSynch := AddressManagement.GetRecRefFromVariant(RecToSynch, TableNo);
        case RecRefToSynch.Number of
            Database::Contact:
                SetupMode := Rec."Synch. Contacts";
            Database::"Address Type":
                SetupMode := Rec."Synch. Addresses";
            Database::"Contact Address":
                SetupMode := Rec."Synch. Addresses";
            Database::"Contact Category":
                SetupMode := Rec."Synch. Contact Categories";
            Database::"Contact Category Assignment":
                SetupMode := Rec."Synch. Contact Categories";
        end;

        SynchSetup.Reset();
        SynchSetup.SetRange("Table No.", RecRefToSynch.Number);
    end;

}
