table 50225 "Partner Group"
{
    DataClassification = ToBeClassified;
    LookupPageId = "Partner Group List";
    DrillDownPageId = "Partner Group List";



    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'Nr.';

        }
        field(2; "Category Code"; Code[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kategorie';
            TableRelation = "Category Type".Description;

            // trigger OnValidate()
            // var
            //     CatType: Record "Category Type";
            // begin
            //     if CatType.Get("Category Code") then
            //         Rec."Category Description" := CatType.Description;

            // end;
        }
        field(3; MemberNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Nr.';
            Editable = false;
            // TableRelation = Members."No.";
        }
        // field(3; "Category Description"; Text[250])
        // {
        //     Caption = 'Kategorie Name';
        //     DataClassification = ToBeClassified;

        // }
        field(4; "Group Code"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Gruppe';
        }
    }

    keys
    {
        key(Key1; "No.", MemberNo)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Rec.MemberNo := xRec.MemberNo;
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