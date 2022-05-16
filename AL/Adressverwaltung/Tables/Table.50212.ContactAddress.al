table 50212 "Contact Address"
{
    Caption = 'Contact Address';
    DataCaptionFields = "Contact No.", "Code", "Company Name";
    LookupPageID = "Contact Address List";

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            CaptionML = ENU = 'Contact No.', DEU = 'Kontaktnr.';
            TableRelation = Contact;
        }
        field(2; "Code"; Code[10])
        {
            CaptionML = ENU = 'Code', DEU = 'Code';
            NotBlank = true;
        }
        field(23; "Address Type"; Code[20])
        {
            CaptionML = ENU = 'Address Type', DEU = 'Art';
            TableRelation = "Address Type";

        }
        field(3; "Company Name"; Text[100])
        {
            CaptionML = ENU = 'Company Name', DEU = 'Name';
        }
        field(4; "Company Name 2"; Text[50])
        {
            CaptionML = ENU = 'Company Name 2', DEU = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            CaptionML = ENU = 'Address', DEU = 'Adresse';
        }
        field(6; "Address 2"; Text[50])
        {
            CaptionML = ENU = 'Address 2', DEU = 'Adresse 2';
        }
        field(7; City; Text[30])
        {
            CaptionML = ENU = 'City', DEU = 'Ort';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(8; "Post Code"; Code[20])
        {
            CaptionML = ENU = 'Post Code', DEU = 'PLZ';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(9; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            CaptionML = ENU = 'County';
        }
        field(10; "Country/Region Code"; Code[10])
        {
            CaptionML = ENU = 'Country/Region Code', DEU = 'Ländercode';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(12; "Phone No."; Text[30])
        {
            CaptionML = ENU = 'Phone No.', DEU = 'Telefonnr.';
            ExtendedDatatype = PhoneNo;
        }
        field(13; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(14; "Extension No."; Text[30])
        {
            Caption = 'Extension No.';
        }
        field(15; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(16; Pager; Text[30])
        {
            Caption = 'Pager';
        }
        field(17; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
                SetSearchEmail();
            end;
        }
        field(18; "Home Page"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(19; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(20; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';
        }
        field(21; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(22; "Search E-Mail"; Code[80])
        {
            Caption = 'Search Email';
        }
    }

    keys
    {
        key(Key1; "Contact No.", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Search E-Mail")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var

    begin

    end;

    trigger OnInsert()
    var

    begin

    end;

    trigger OnModify()
    var

    begin

    end;

    trigger OnRename()
    var

    begin

    end;


    var
        PostCode: Record "Post Code";

    local procedure SetSearchEmail()
    begin
        if "Search E-Mail" <> "E-Mail".ToUpper() then
            "Search E-Mail" := "E-Mail";
    end;
}

