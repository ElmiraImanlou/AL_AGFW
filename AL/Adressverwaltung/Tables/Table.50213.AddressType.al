table 50213 "Address Type"
{
    DataClassification = CustomerContent;
    Caption = 'Adressart';
    LookupPageId = "Address Type List";
    DrillDownPageId = "Address Type List";


    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(2; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Beschreibung';

        }

    }

    keys
    {
        key(PrimaryKey; Code)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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

}