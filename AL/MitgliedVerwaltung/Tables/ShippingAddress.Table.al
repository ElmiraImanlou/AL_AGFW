table 50221 "Shipping Address"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
            Caption = 'Kontat Nr.';
        }
        field(2; Type; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Art';
        }
        field(3; "Contact Person"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ansprechpartner';
        }
        field(4; Addition; Text[250])
        {
            Caption = 'Zusatz';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Contact No.", Type, "Contact Person")
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