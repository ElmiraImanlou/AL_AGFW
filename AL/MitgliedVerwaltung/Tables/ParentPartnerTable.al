table 50222 "Parent Partner"
{
    Caption = 'Partner';
    DataClassification = ToBeClassified;
    LookupPageId = "Parent Partner List";
    DrillDownPageId = "Parent Partner List";


    fields
    {
        field(1; "Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = contact where(ParentPartner = const(true));
            Caption = 'Kontakt Nr.';

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                Contact.Get("Contact No.");
                "Parent Name" := Contact.Name;
            end;

        }
        field(2; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Caption = 'Nr.';
        }
        field(3; MemberNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Nr.';
            Editable = false;
            // TableRelation = Members."No.";
        }
        // field(3; "Member No."; Code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = Members;
        //     Caption = 'Mitglied Nr.';
        // }
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
        field(7; "Parent Relationship"; text[250])
        {
            Caption = 'Übergeordnete Beziehung';
            DataClassification = ToBeClassified;
            // OptionMembers = "Mitgliedsstatus","VDEW Mitglied","VU-Nr. Kälte","VU-Nr. Wärme";
            TableRelation = Relationship.Description where(Type = const("Parent Partner"));

        }
        field(9; "Parent Name"; Text[250])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;

        }
        field(10; "Sub Name"; Text[250])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;

        }
        field(11; "Member Directory"; Boolean)
        {
            Caption = 'Mitgliederverzeichnis';
            DataClassification = ToBeClassified;

        }



    }

    keys
    {
        key(Key1; "Contact No.", MemberNo)
        {
            Clustered = true;
        }
    }

    var
        Members: Record Members;


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