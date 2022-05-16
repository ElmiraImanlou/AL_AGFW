table 50214 Members
{
    Caption = 'Mitglieden';
    LookupPageId = "Members List";
    DrillDownPageId = "Members List";


    fields
    {

        field(1; "Company No."; Code[20])
        {
            Caption = 'Unternehmen Nr.';
            NotBlank = true;
            TableRelation = Contact where(Type = const(Company));
            trigger OnValidate()
            var
                MemberInvoice: Record "Member Price Of Invoice";
                IsHandled: Boolean;
                NoSeriesRec: Record "No. Series";
                NOSeriesLine: record "No. Series Line";
                ParentPart: Record "Parent Partner";


            begin
                Contact.Get("Company No.");
                Rec.Address := Contact.Address;
                Rec."Home Page" := Contact."Home Page";
                Rec."Fax No." := Contact."Fax No.";
                Rec."E-Mail" := Contact."E-Mail";
                Rec."Mobile Phone No." := Contact."Mobile Phone No.";
                Rec."Phone No." := Contact."Phone No.";
                Rec.City := Contact.City;
                Rec."Post Code" := Contact."Post Code";
                Rec."Address 2" := Contact."Address 2";
                Rec."Company Name" := Contact.Name;
                Rec."Country/Region Code" := Contact."Country/Region Code";
                Rec."No." := 'MIT_' + "Company No.";

            end;


        }
        field(2; "No."; Code[20])
        {
            Caption = 'Mitglied Nr.';
            trigger OnValidate()
            var
                ParentPartner: Record "Parent Partner";

            begin


                // IsHandled := false;
                // OnBeforeValidateNo(Rec, IsHandled);
                // if IsHandled then
                //     exit;

                // if "No." <> xRec."No." then begin
                //     RMSetup.Get();
                //     NoSeriesMgt.TestManual(RMSetup."Member No.");
                //     "No. Series" := '';

                // end;
            end;

        }

        field(3; "Members Type"; Code[250])
        {
            Caption = 'Mitgliedsart';
            TableRelation = "Member Type".Description;
        }
        field(4; "Company Name"; Code[50])
        {
            Caption = 'Unternehmensname';

        }
        field(5; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            NotBlank = true;
            TableRelation = Contact;
        }
        field(6; Comment; Text[250])
        {
            Caption = 'Bemerkung';
        }
        field(7; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(8; "Parent Partner No."; Code[20])
        {

            // TableRelation = "Parent Partner";

        }
        field(9; "Sub Partner No."; Code[20])
        {

            TableRelation = "Sub Partner";
        }
        field(14; Address; Text[100])
        {
            Caption = 'Adresse';
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact.Address := Rec.Address;
                Contact.Modify(true);
            end;

        }
        field(15; "Address 2"; Text[50])
        {
            Caption = 'Adresse 2';
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."Address 2" := Rec."Address 2";
                Contact.Modify(true);
            end;
        }
        field(16; City; Text[30])
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
                OnBeforeLookupCity(Rec, PostCode);

                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact.City := Rec.City;
                Contact.Modify(true);
            end;

        }
        field(17; "Phone No."; Text[30])
        {
            Caption = 'Telefonnr.';
            ExtendedDatatype = PhoneNo;
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."Phone No." := Rec."Phone No.";
                Contact.Modify(true);
            end;
        }
        field(18; "Country/Region Code"; Code[10])
        {
            Caption = 'Länder-/Regionscode';
            TableRelation = "Country/Region";

            trigger OnValidate()
            var

            begin

                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", County, "Country/Region Code", xRec."Country/Region Code");

                Contact.Get("Company No.");
                Contact."Country/Region Code" := Rec."Country/Region Code";
                Contact.Modify(true);
            end;

        }
        field(19; "Fax No."; Text[30])
        {
            Caption = 'Faxnr.';
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."Fax No." := Rec."Fax No.";
                Contact.Modify(true);
            end;
        }
        field(20; "Post Code"; Code[20])
        {
            Caption = 'PLZ-Code';
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."Post Code" := Rec."Post Code";
                Contact.Modify(true);
            end;
        }
        field(21; County; Text[30])
        {
            // CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'Land';
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact.County := Rec.County;
                Contact.Modify(true);
            end;
        }
        field(22; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."E-Mail" := Rec."E-Mail";
                Contact.Modify(true);
            end;

        }
        field(23; "Home Page"; Text[80])
        {
            Caption = 'Homepage';
            ExtendedDatatype = URL;
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."Home Page" := Rec."Home Page";
                Contact.Modify(true);
            end;
        }
        Field(24; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobiltelefonnr.';
            ExtendedDatatype = PhoneNo;
            trigger OnValidate()
            var

            begin
                Contact.Get("Company No.");
                Contact."Mobile Phone No." := Rec."Mobile Phone No.";
                Contact.Modify(true);
            end;
        }
        field(25; MemberDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Seit';


        }


    }


    keys
    {
        key(Key1; "Company No.")
        {
            Clustered = true;
        }

    }

    var
        ParentPart: Record "Parent Partner";
        SubPartner: Record "Sub Partner";
        ContactNo: Record Contact;
        ShipAddress: Record "Shipping Address";
        PartnerGroup: Record "Partner Group";
        MembPriceOfInv: Record "Member Price Of Invoice";
        HistoryYear: Record "History Year";


    trigger OnModify()
    var
    begin

    end;

    trigger OnDelete()
    begin
        ParentPart.SetRange(MemberNo, Rec."No.");
        if ParentPart.FindSet() then
            ParentPart.DeleteAll(true)
        else
            ;

        SubPartner.SetRange(MemberNo, Rec."No.");
        if SubPartner.FindSet() then
            SubPartner.DeleteAll(true)
        else
            ;

        ShipAddress.SetRange("Contact No.", Rec."Company No.");
        if ShipAddress.FindSet() then
            ShipAddress.DeleteAll()
        else
            ;

        PartnerGroup.SetRange(MemberNo, Rec."No.");
        if PartnerGroup.FindSet() then
            PartnerGroup.DeleteAll()
        else
            ;

        MembPriceOfInv.SetRange(MemberNo, Rec."No.");
        if MembPriceOfInv.FindSet() then
            MembPriceOfInv.DeleteAll()
        else
            ;

        HistoryYear.SetRange(MemberNo, Rec."No.");
        HistoryYear.SetRange(MemberType, Rec."Members Type");

        if HistoryYear.FindSet() then
            HistoryYear.DeleteAll()
        else
            ;







    end;

    trigger OnRename()
    begin

    end;

    trigger OnInsert()
    var

    begin

    end;


    var

        RMSetup: Record "Marketing Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Contact: Record Contact;
        LineNo: Integer;



    procedure AssistEdit(OldMemb: Record Members) Result: Boolean
    var
        Memb: Record Members;
        IsHandled: Boolean;

    begin
        IsHandled := false;
        OnBeforeAssistEdit(Rec, OldMemb, IsHandled, Result);
        if IsHandled then
            exit(Result);

        with Memb do begin
            Memb := Rec;
            RMSetup.Get();
            RMSetup.TestField("Member No.");
            if NoSeriesMgt.SelectSeries(RMSetup."Member No.", OldMemb."No. Series", "No. Series") then begin
                RMSetup.Get();
                RMSetup.TestField("Member No.");
                NoSeriesMgt.SetSeries("No.");
                Rec := Memb;
                exit(true);
            end;
        end;
    end;


    var
        PostCode: Record "Post Code";


    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateNo(var Members: Record Members; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeAssistEdit(var Member: record Members; OldMemb: Record Members; var IsHandled: Boolean; var Result: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupCity(var Members: Record Members; var PostCode: Record "Post Code")
    begin
    end;


}