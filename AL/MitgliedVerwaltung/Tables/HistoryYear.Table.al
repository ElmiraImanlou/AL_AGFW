table 50230 "History Year"
{
    DataClassification = ToBeClassified;
    LookupPageId = "History Year List";
    DrillDownPageId = "History Year List";
    Caption = 'Jahr Geschichte';

    fields
    {

        field(1; Year; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Jahr';
            TableRelation = Years;
        }
        field(2; WOB; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'WOB';
        }
        field(4; MemberNo; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Nr.';
            Editable = false;
            // TableRelation = Members."No.";
        }
        field(3; MemberType; Code[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Member Type".Description;
            Caption = 'Mitgliedart';

        }
        field(11; "WOB Date"; Date)//JahrsDatum
        {
            DataClassification = ToBeClassified;
            Caption = 'Datum';
        }
        field(5; "WOB IST"; Decimal)//Beitrag Soll
        {
            Caption = 'Beitrag IST';

        }

        field(7; "WOB Soll"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Beitrag SOLL';
        }

        field(9; "WOB Difference"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Differenz';

        }
        field(10; "WOB Comment"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Reduzierungsgerund';

        }

        field(13; "WZP Date"; Date)//JahrsDatum
        {
            DataClassification = ToBeClassified;
            Caption = 'WZP Datum';
        }
        field(14; "WZP IST"; Decimal)//Beitrag Soll
        {
            Caption = 'WZP Beitrag IST';

        }

        field(15; "WZP Soll"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'WZP Beitrag SOLL';
        }

        field(16; "WZP Difference"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'WZP Differenz';

        }
        field(17; "WZP Comment"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'WZP Reduzierungsgerund';

        }
        field(18; "FuE Date"; Date)//JahrsDatum
        {
            DataClassification = ToBeClassified;
            Caption = 'FuE Datum';
        }
        field(19; "FuE IST"; Decimal)//Beitrag Soll
        {
            Caption = 'FuE Beitrag IST';

        }

        field(20; "FuE Soll"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'FuE Beitrag SOLL';
        }

        field(21; "FuE Difference"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'FuE Differenz';

        }
        field(22; "FuE Comment"; text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'FuE Reduzierungsgerund';
        }
        field(23; "Vote Number"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Stimmen Anzahl';

        }
        field(24; "Contribution Money"; Decimal)//Beitragsgeld
        {
            DataClassification = ToBeClassified;
            Caption = 'Beitragsgeld';
        }
        field(25; ContactNo; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(26; ContactNoFUE; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(27; ContactNoWZP; Code[20])
        {
            DataClassification = ToBeClassified;

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
        field(36; OrderNo_WOB; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bestellnummer WOB';
        }
        field(40; OrderNo_WZP; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bestellnummer WZP';

        }
        field(41; OrderNo_FUE; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bestellnummer FUE';
        }
        field(42; MemberDate; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mitglied Seit';
        }
        field(43; AmountCalc; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anteilig für das jahr';//'Beitragsrechnung Geschäftsjahr'
        }
        field(44; AmountCalcWZP; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anteilig für das jahr WZP';//'Beitragsrechnung Geschäftsjahr'
        }
        field(45; AmountCalcFUE; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Anteilig für das jahr Fu.E';//'Beitragsrechnung Geschäftsjahr'
        }

    }

    keys
    {
        key(Key1; Year, MemberType, MemberNo)
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