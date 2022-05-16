table 50223 "Sub Partner"
{
    Caption = 'Partner';
    DataClassification = ToBeClassified;
    LookupPageId = "Sub Partner List";
    DrillDownPageId = "Sub Partner List";

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Nr.';
            AutoIncrement = true;
        }
        field(2; "Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = contact where(ParentPartner = const(false));
            Caption = 'Kontakt Nr.';

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                Contact.Get("Contact No.");
                "Sub Name" := Contact.Name;
            end;

        }
        field(3; MemberNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Nr.';
            // Editable = false;
            // TableRelation = Members."No.";
        }
        field(4; "Reference No."; Code[20])
        {
            Caption = 'Referenz Nr.';
            DataClassification = ToBeClassified;
        }
        field(5; "From Date"; Date)
        {
            Caption = 'Von Datum';
            DataClassification = ToBeClassified;
        }
        field(6; "Until Date"; Date)
        {
            Caption = 'Bis Datum';
            DataClassification = ToBeClassified;
        }
        field(7; "Sub Relationship"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Unter Beziehung';
            TableRelation = Relationship.Description where(Type = const("Sub Partner"));
        }
        field(8; "Sub Name"; Text[250])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(9; "Member Directory"; Boolean)
        {
            Caption = 'Mitgliederverzeichnis';
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "No.", "Sub Relationship", "Sub Name", MemberNo)
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