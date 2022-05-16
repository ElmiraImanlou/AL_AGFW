table 50226 "Category Type"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Categories Type List";
    DrillDownPageId = "Categories Type List";

    fields
    {
        field(1; Code; Code[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';

        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Beschreibung';
        }
        field(3; "Group Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Gruppe';
            TableRelation = "Group Type".Description;
        }
    }

    keys
    {
        key(Key1; Code, Description)
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