table 50224 "Member Address Type"
{
    DataClassification = CustomerContent;
    LookupPageId = "Member Address Type List";
    DrillDownPageId = "Member Address Type List";

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';

        }
        field(2; Description; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Beschreibung';

        }
    }

    keys
    {
        key(Key1; Code)
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