table 50210 "Contact Category"
{
    DataClassification = CustomerContent;
    Caption = 'Kontakt Kategorie';
    DrillDownPageId = "Contact Category List";
    LookupPageId = "Contact Category List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';

        }
        field(2; Description; Code[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Beschreibung';
        }
        field(3; "Available for Contact Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Verfügbar für Kontakt Type';
            OptionMembers = Person,Company,Both;
            OptionCaptionML = DEU = 'Person,Unternehmen,Beide', ENU = 'Person,Company,Both';

        }
        field(4; Locked; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Gesperrt';
        }
    }

    keys
    {
        key(PrimaryKey; "Code")
        {
            Clustered = true;
        }
    }

}