table 50227 "Group Type"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Group Type List";
    DrillDownPageId = "Group Type List";

    fields
    {
        // field(1; Code; Code[20])
        // {
        //     DataClassification = ToBeClassified;

        // }
        field(2; "Category Code"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kategorie Code';
            TableRelation = "Category Type".Description;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Beschreibung';
        }
    }

    keys
    {
        key(Key1; Description)
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