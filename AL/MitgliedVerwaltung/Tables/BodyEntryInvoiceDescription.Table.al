table 50300 "Body Entry Invoice Description"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Body Entry Invoice Description";
    LookupPageId = "Body Entry Invoice Description";


    fields
    {
        field(1; ItemNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Artikel Nr.';
            TableRelation = Item."No.";

        }
        field(2; LineNo; Integer)
        {

        }
        field(3; ItemDescription; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Artikel Beschreibung';
            // OptionMembers = Beitrittsgeld,"Beitragsrechnung Geschäftsjahr","Beitragsrechnung Wärmezählerprogramm","Beitragsrechnung Gemeinschaftsforschungsprojekt";
        }

        field(4; MemberType; Code[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Member Type".Description;
        }
        field(5; TextBody; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; TextPosition; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = TITEL,BODYHEADER,BODYFOOTER,BODYEND;

        }

    }

    keys
    {
        key(Key1; ItemNo, LineNo, ItemDescription, MemberType, TextBody, TextPosition)
        {
            Clustered = true;
        }
    }

    var


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