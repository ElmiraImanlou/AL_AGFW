table 50234 Relationship
{
    DataClassification = ToBeClassified;
    Caption = 'Beziehung';
    LookupPageId = "Relationship List";
    DrillDownPageId = "Relationship List";


    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';

        }
        field(2; Description; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Beschreibung';

        }
        field(3; Type; Option)
        {
            Caption = 'Art';
            DataClassification = ToBeClassified;
            OptionMembers = "Parent Partner","Sub Partner";
            OptionCaption = 'Übergeordnete,Untergeordnete';

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