table 50232 "Contribution Regulation"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Contribution Regulation List";
    LookupPageId = "Contribution Regulation List";
    Caption = 'Beitragsordnung';


    fields
    {
        field(1; Year; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Jahr';
        }
        field(2; "Member Type"; Code[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitgliedart';
            TableRelation = "Member Type".Description;
        }
        field(3; "Until TJ/MA"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Bis TJ/MA';
        }
        field(5; "GWh"; Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Price WOB"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Betrag WOB';
        }
        field(9; "Price WZP"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Betrag WZP';
        }
        field(10; "Price FUE"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Betrag FUE';
        }
        field(11; "Vote Number"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Stimmen';
        }
    }

    keys
    {
        key(Key1; Year, "Member Type", "Until TJ/MA", "Price WOB", GWh)
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; Year)
        {

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