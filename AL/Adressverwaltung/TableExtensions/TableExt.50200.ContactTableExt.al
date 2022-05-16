tableextension 50200 "Contact Table EXT" extends Contact
{
    fields
    {
        field(50200; "Phonetic Hash (Name)"; Text[50])
        {
            CaptionML = DEU = 'Phonetischer Hashwert (Name)';
        }
        field(50201; "Assigned User"; Code[50])
        {
            TableRelation = User."User Name";
        }
        field(50202; "Academic Degree"; Text[50])
        {
            CaptionML = DEU = 'Akademischer Grad', ENU = 'Academic degree';
        }
        field(50212; AddressType; Code[20])
        {
            Caption = 'Adressart';
            TableRelation = "Address Type";
        }
        field(50213; Member; Code[50])
        {
            Caption = 'Mitglied';

        }
        field(5014; ParentPartner; Boolean)
        {
            Caption = 'Übergeordneter Partner';

        }
        field(5015; "Member Type"; Code[250])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Members."Members Type" where("Company No." = field("No."));
            Caption = 'Mitgliedsart';

        }
        modify(Address)
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                IF Members.Get("No.") then begin

                    Members.Address := Rec.Address;
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Address 2")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                IF Members.Get("No.") then begin

                    Members."Address 2" := Rec."Address 2";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Country/Region Code")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                IF Members.Get("No.") then begin

                    Members."Country/Region Code" := Rec."Country/Region Code";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Post Code")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members."Post Code" := Rec."Post Code";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify(City)
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members.City := Rec.City;
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Phone No.")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                If Members.Get("No.") then begin

                    Members."Phone No." := Rec."Phone No.";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Mobile Phone No.")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members."Mobile Phone No." := Rec."Mobile Phone No.";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("E-Mail")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members."E-Mail" := Rec."E-Mail";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Fax No.")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members."Fax No." := Rec."Fax No.";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify("Home Page")
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members."Home Page" := Rec."Home Page";
                    Members.Modify(true);
                end else
                    ;
            end;
        }
        modify(County)
        {
            trigger OnAfterValidate()
            var
                Members: Record Members;
            begin
                if Members.Get("No.") then begin

                    Members.County := Rec.County;
                    Members.Modify(true);
                end else
                    ;
            end;
        }

    }

    keys
    {
        key(PhoneticHash; "Phonetic Hash (Name)")
        {

        }
    }
    var
        MembersType: Record Members;


}