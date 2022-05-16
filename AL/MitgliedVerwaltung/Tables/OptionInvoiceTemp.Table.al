table 50301 "Option Invoice Temp"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Option Invoice List";


    fields
    {
        field(1; Code; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Beitragsrechnung';

        }
        field(2; Checked; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Auswahl';
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