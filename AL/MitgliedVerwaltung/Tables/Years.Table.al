table 50233 Years
{
    DataClassification = ToBeClassified;
    LookupPageId = "Years List";
    DrillDownPageId = "Years List";
    Caption = 'Jahr';

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Jahr';
            DataClassification = ToBeClassified;
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