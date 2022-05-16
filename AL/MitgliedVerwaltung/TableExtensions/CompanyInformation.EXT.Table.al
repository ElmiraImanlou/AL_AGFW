tableextension 50304 "Company Info EXT" extends "Company Information"
{
    fields
    {
        // Add changes to table fields here
        field(50301; "Office Postcode"; Code[50])
        {
            Caption = 'PLZ-Postfach';
            DataClassification = ToBeClassified;
        }
        field(50302; "Post Office Box"; Code[250])
        {
            Caption = 'Postfach';
            DataClassification = ToBeClassified;
        }
        field(50303; ExtraAddress; Text[100])
        {
            Caption = 'Adresse';
        }
        field(50304; "Extra Post Code"; Code[20])
        {
            Caption = 'PLZ';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".Code
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code".Code WHERE("Country/Region Code" = FIELD("Country/Region Code"));
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
        field(503045; "Extra City"; Text[30])
        {
            Caption = 'Ort';
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
        field(50306; "President of the Association"; Text[250])
        {
            Caption = 'Präsident des Verbandes';

        }
        field(50307; "Managing directors"; text[250])
        {
            Caption = 'Geschäftsführung';
        }
        field(50308; "Vereinsregistergericht"; text[250])
        {
            Caption = 'Vereinsregistergericht';
        }

    }

    var
        PostCode: Record "Post Code";
}