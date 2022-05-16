table 50228 "Member Price Of Invoice"
{
    DataClassification = CustomerContent;
    Caption = 'Rechnungsbeiträge';
    DrillDownPageId = "Member Price Of Invoice List";

    fields
    {
        field(55; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Nr.';
            AutoIncrement = true;
            // TableRelation = Members."No.";
        }

        field(1; YearCode; Code[20])
        {
            Caption = 'Beitragsjahr';
            DataClassification = ToBeClassified;
            TableRelation = Years;

        }
        field(2; WOB; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'WOB';

        }
        field(3; MemberNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Nr.';
            Editable = false;
            // TableRelation = Members."No.";
        }
        field(4; "Contribution Type"; Code[250])//BeitragsType
        {
            DataClassification = ToBeClassified;
            TableRelation = "Member Type".Description;
            Caption = 'BeitragsType';
        }
        field(5; WOBDifferenceAmount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Differenzbetrag';
        }
        field(6; "Contribution Money"; Decimal)//Beitragsgeld
        {
            DataClassification = ToBeClassified;
            Caption = 'Beitragsgeld';
        }
        field(8; "Contribution SOLL"; Decimal)//Beitrag SOLL
        {
            DataClassification = ToBeClassified;
            Caption = 'Beitrag Soll';
            Editable = false;
        }
        field(9; "Contribution IST"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Beitrag IST';
        }
        field(10; "Date of Invoice"; Date)//Rechnungsdatum
        {
            DataClassification = ToBeClassified;
            Caption = 'Rechnungsdatum';
        }
        field(11; Comment; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reduzierungsgrund WOB';

        }
        field(12; FuESollAmount; Decimal)
        {
            Caption = 'Fu.E Umlage Soll';
            DataClassification = ToBeClassified;
        }
        field(13; FuEISAmount; Decimal)
        {
            Caption = 'Fu.E Umlage IST';
            DataClassification = ToBeClassified;
        }
        field(14; FuEDifferenceAmount; Decimal)
        {
            Caption = 'Fu.E Differenzbetrag';
            DataClassification = ToBeClassified;
        }
        field(15; FuEInvoiceDate; Date)
        {
            Caption = 'Rechnungsdatum Fu.E';
            DataClassification = ToBeClassified;
        }
        field(16; WZPSOLLAmount; Decimal)
        {
            Caption = 'Beitrag WZP SOLL';
            DataClassification = ToBeClassified;
        }
        field(17; WZPISAmount; Decimal)
        {
            Caption = 'Beitrag WZP IST';
            DataClassification = ToBeClassified;
        }
        field(18; WZPDifferenceAmount; Decimal)
        {
            Caption = 'WZP Differenzbetrag ';
            DataClassification = ToBeClassified;
        }
        field(19; InvoiceDateWZP; Date)
        {
            Caption = 'Rechnungsdatum WZP ';
            DataClassification = ToBeClassified;
        }
        field(20; "Vote Type"; text[250])
        {
            Caption = 'Stimmen Type';
            DataClassification = ToBeClassified;
        }
        field(21; "Vote Number"; Integer)
        {
            Caption = 'Stimmen Anzahl';
            DataClassification = ToBeClassified;
        }
        field(22; "Amount VDEW"; Decimal)
        {
            Caption = 'Beitrag VDEW';
            DataClassification = ToBeClassified;
        }
        field(23; "Amount VDEW 15.5 %"; Decimal)
        {
            Caption = 'Beitrag VDEW';
            DataClassification = ToBeClassified;
        }
        field(24; Comment2; Text[250])
        {
            Caption = 'Bemerkung';
            DataClassification = ToBeClassified;
        }
        field(25; "WZP Comment"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reduzierungsgrund WZP';

        }
        field(26; "FuE Comment"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reduzierungsgrund Fu.E';

        }
        field(27; "FUE OrderNr"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bestellnummer Fu.E';

        }
        field(28; "WZP OrderNr"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bestellnummer WZP';

        }
        field(29; "WOB OrderNr"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bestellnummer WOB';

        }
        field(30; "ContactNo."; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Contact."No." where(Type= const(Company)) ;
            TableRelation = Contact."No.";
            Caption = 'Kontakt Nr.';
        }
        field(31; InvoiceSend; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rechnung verschickt';
            OptionMembers = "By Mail","By post";
            OptionCaption = 'Per E-Mail,Per post';
        }
        field(32; ContactInfo; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kontakt Adresse/E-Mail';
        }
        field(33; "ContactNo. WZP"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Contact."No." where(Type= const(Company)) ;
            TableRelation = Contact."No.";
            Caption = 'Kontakt Nr. WZP';
        }
        field(34; "InvoiceSend WZP"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rechnung verschickt WZP';
            OptionMembers = "By Mail","By post";
            OptionCaption = 'Per E-Mail,Per post';
        }
        field(35; "ContactInfo WZP"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kontakt Adresse/E-Mail WZP';
        }
        field(36; "ContactNo. FUE"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Contact."No." where(Type= const(Company)) ;
            TableRelation = Contact."No.";
            Caption = 'Kontakt Nr. Fu.E';
        }
        field(37; "InvoiceSend FUE"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rechnung verschickt Fu.E';
            OptionMembers = "By Mail","By post";
            OptionCaption = 'Per E-Mail,Per post';
        }
        field(38; "ContactInfo FUE"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Kontakt Adresse/E-Mail Eu.E';
        }
        field(39; MemberDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Seit';

        }
        field(40; AmountCalc; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anteilig für das jahr';//'Beitragsrechnung Geschäftsjahr'
        }
        field(41; AmountCalcWZP; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anteilig für das jahr WZP';//'Beitragsrechnung Geschäftsjahr'
        }
        field(42; AmountCalcFUE; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anteilig für das jahr Fu.E';//'Beitragsrechnung Geschäftsjahr'
        }



    }

    keys
    {

        key(Key1; YearCode, "Contribution Type", MemberNo)
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