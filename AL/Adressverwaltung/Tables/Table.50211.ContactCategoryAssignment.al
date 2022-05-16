table 50211 "Contact Category Assignment"
{
    DataClassification = ToBeClassified;
    Caption = 'Zuordnung der Kontaktkategorie';
    DrillDownPageId = "Contact Category Assign.";


    fields
    {
        field(1; "Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kontakt Nr.';
            TableRelation = Contact;
            NotBlank = true;

        }
        field(2; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gültig von';

        }
        field(3; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Gültig bis';
        }
        field(4; "Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kategorie Code';
            TableRelation = "Contact Category";
            NotBlank = true;
        }
    }

    keys
    {
        key(PrimaryKey; "Contact No.", "Start Date", "End Date", "Category Code")
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