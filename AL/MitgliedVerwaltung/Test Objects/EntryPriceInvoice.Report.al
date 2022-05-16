report 50200 "Entry Price Invoice"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Beitrittsgeld Rechnung';
    DefaultLayout = RDLC;
    RDLCLayout = './MitgliedVerwaltung/EntryPriceInvoiceTest.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Member Price Of Invoice"; "Member Price Of Invoice")
        {
            RequestFilterFields = "ContactNo.";

            column(No_MemberPriceOfInvoice; "No.")
            {
            }
            // column(Entry_Invoice_Des; "Entry Invoice Des.")
            // {
            // }
            column(BeitrittsDescription; BeitrittsDescription)
            {
            }
            column(ContactNo_MemberPriceOfInvoice; "ContactNo.")
            {
            }
            column(YearCode; YearCode)
            {
            }
            column(ContributionMoney_MemberPriceOfInvoice; "Contribution Money")
            {
            }
            column(ContributionType_MemberPriceOfInvoice; "Contribution Type")
            {
            }
            column(ContributionIST_MemberPriceOfInvoice; "Contribution IST")
            {
            }
            column(WZPISAmount_MemberPriceOfInvoice; WZPISAmount)
            {
            }
            column(FuEISAmount_MemberPriceOfInvoice; FuEISAmount)
            {
            }
            column(DateofInvoice_MemberPriceOfInvoice; "Date of Invoice")
            {
            }
            column(CompanyInfo; CompanyInfo.Picture)
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyAddr1; CompanyAddr[1])
            {
            }
            column(CompanyAddr2; CompanyAddr[2])
            {
            }
            column(CompanyAddr3; CompanyAddr[3])
            {
            }
            column(CompanyAddr4; CompanyAddr[4])
            {
            }
            column(CompanyAddr5; CompanyAddr[5])
            {
            }
            column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfoHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyInfoEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyInfoBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyInfoRegNo; CompanyInfo.GetRegistrationNumber)
            {
            }
            column(YourAsignLabel; YourSign)
            {
            }
            column(YourSMSLabel; YourSMS)
            {
            }
            column(YourTax; YourTax)
            {
            }
            column(OurSignLabel; OurSign)
            {
            }
            column(TelefonLabel; Telefon)
            {
            }
            column(Telefax; Telefax)
            {
            }
            column(DateLabel; DateLabel)
            {
            }
            column(AddressLabel; AddressLabel)
            {
            }
            column(CapitalOffice; CapitalOffice)
            {
            }
            column(BankDetails; BankDetails)
            {
            }
            column(TaxID; TaxID)
            {
            }
            column(TaxNummerAddress; TaxNummerAddress)
            {
            }
            column(DocumentNo; DocumentNo)
            {
            }
            column(MemberNo; MemberNo)
            {
            }
            column(OrderNo; OrderNo)
            {
            }
            column(FirstAccordingtoTextBody; FirstAccordingtoTextBody)
            {
            }
            column(EndAccordingTextBody; EndAccordingTextBody)
            {
            }
            column(FirstPleaseBody; FirstPleaseBody)
            {
            }
            column(EndTaxTextBody; EndTaxTextBody)
            {
            }
            column(EndTextBody; EndTextBody)
            {
            }
            column(CompanyCompletAddress; CompanyCompletAddress)
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoAddress; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfoCity; CompanyInfo.City)
            {
            }
            column(CompanyInfoSWIFTCode; SWIFTCode.Name)
            {
            }
            column(CompanyInfoIBAN; CompanyInfo.IBAN)
            {
            }
            column(CompanyInfoRegNumber; CompanyInfo."Registration No.")
            {
            }
            column(CompanyAnschrift; CompanyAnschrift)
            {
            }
            column(Beitrittsgeld; Beitrittsgeld)
            {
            }
            column(BeitrittsgeldCaption; BeitrittsgeldCaption)
            {
            }
            column(MemberInvoiceAmount; MemberInvoiceAmount)
            {
            }
            column(MemberInvoiceAmountGemeinschaft; MemberInvoiceAmountGemeinschaft)
            {
            }
            column("MemberInvoiceAmountGeschäftsjahr"; MemberInvoiceAmountGeschäftsjahr)
            {
            }
            column("MemberInvoiceAmountWärmezähler"; MemberInvoiceAmountWärmezähler)
            {
            }
            column(AllInvoices; AllInvoices)
            {
            }
            dataitem(Contact; Contact)
            {
                DataItemLink = "No." = field("ContactNo.");
                DataItemLinkReference = "Member Price Of Invoice";

                column(AddressManagement; AddressManagement.ContactFormatAddress(Contact))
                {
                }
            }
            trigger OnAfterGetRecord()
            var
                BodyText: Record "Body Entry Invoice Description";
                BodyText2: Record "Body Entry Invoice Description";
            begin
                CompanyCompletAddress := CompanyInfo.Name + '|' + CompanyInfo."Address 2" + '|' + CompanyInfo."Post Code" + ' ' + CompanyInfo.City;
                CompanyAnschrift := CompanyInfo.Name + '|' + CompanyInfo.Address + CompanyInfo."Address 2" + CompanyInfo."Post Code" + ' ' + CompanyInfo.City;

                if BeitrittsDescription <> '' then begin

                    BodyText.SetFilter(ItemDescription, BeitrittsDescription);
                    BodyText.SetFilter(MemberType, "Contribution Type");
                    if BodyText.FindFirst() then begin
                        BeitrittsgeldCaption := BodyText.ItemDescription; //'Beitrittsgeld für den Erwerb der %1 im Jahr %2';
                        if BeitrittsDescription = 'Beitrittsgeld' then begin //BeitrittsDescription:: 
                            MemberInvoiceAmount := "Member Price Of Invoice"."Contribution Money";
                            // BodyText2.SetFilter(ItemDescription, BeitrittsDescription);// Change Body 
                            // BodyText2.SetFilter(MemberType, "Contribution Type");
                            // BodyText2.SetFilter(BodyText2.TextPosition, 'Body');
                            // if BodyText2.FindSet() then
                            //     repeat
                            //         FirstAccordingtoTextBody += BodyText2.Description;
                            //     until BodyText2.Next() = 0;
                        end;
                        if BeitrittsDescription = 'Beitragsrechnung Geschäftsjahr' then // BeitrittsgeldCaption := 'Beitragsrechnung für das Geschäftsjahr Jahr %2';
                            "MemberInvoiceAmountGeschäftsjahr" := "Member Price Of Invoice"."Contribution IST";
                        if BeitrittsDescription = 'Beitragsrechnung Gemeinschaftsforschungsprojekt' then // BeitrittsgeldCaption := 'Beitragsrechnung für das Gemeinschaftsforschungsprojekt "Energie- und kosteneffiziente Wärmeversorgung"';
                            MemberInvoiceAmountGemeinschaft := "Member Price Of Invoice".FuEISAmount;
                        if BeitrittsDescription = 'Beitragsrechnung Wärmezählerprogramm' then // BeitrittsgeldCaption := 'Beitragsrechnung für das Wärmezählerprüfprogramm';
                            "MemberInvoiceAmountWärmezähler" := "Member Price Of Invoice".WZPISAmount;
                    end;
                end else begin
                    BodyText.SetFilter(ItemDescription, BeitrittsDescription);
                    BodyText.SetFilter(MemberType, "Contribution Type");
                    if BodyText.FindFirst() then begin
                        BeitrittsgeldCaption := BodyText.ItemDescription;

                        MemberInvoiceAmount := "Member Price Of Invoice"."Contribution Money";
                        "MemberInvoiceAmountGeschäftsjahr" := "Member Price Of Invoice"."Contribution IST";
                        MemberInvoiceAmountGemeinschaft := "Member Price Of Invoice".FuEISAmount;
                        "MemberInvoiceAmountWärmezähler" := "Member Price Of Invoice".WZPISAmount;

                    end;
                end;




            end;

        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // Caption ='';
                    field(BeitrittsDescription; BeitrittsDescription)
                    {
                        TableRelation = item;
                        // DataClassification = Basic, Suite;
                        Caption = 'Rechnung für:';

                        trigger OnValidate()
                        var
                            ItemsDescription: Record Item;
                        begin
                            ItemsDescription.Get(BeitrittsDescription);
                            BeitrittsDescription := ItemsDescription.Description;
                        end;
                    }
                    // field(AllInvoices; AllInvoices)
                    // {
                    //     Caption = 'Alle Beiträge';
                    //     trigger OnValidate()
                    //     var
                    //         myInt: Integer;
                    //     begin

                    //     end;
                    // }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        AllInvoices: Boolean;
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        AddressManagement: Codeunit "Address Management";
        YourSign: Label 'Ihre Zeichnen:';
        YourSMS: Label 'Ihre Nachricht Vom:';
        OurSign: Label 'Unsere Zeichnen:';
        Telefon: Label 'Telefon';
        Telefax: Label 'Telefax';
        DateLabel: Label 'Datum';
        AddressLabel: Label 'Anschrift:';
        CapitalOffice: Label 'Hauptstadtbüro:';
        BankDetails: Label 'Bankverbindung:';
        TaxID: Label 'Umsatzsteuer-ID:';
        TaxNummerAddress: Label 'Steuernummber beim Finanzamt -Frankfurt am Main:';
        DocumentNo: Label 'Rechnungsnummer:';
        MemberNo: Label 'Ihre Mitgliedsnummer:';
        OrderNo: Label 'Ihre Bestellung/Auftrag:';
        YourTax: Label 'Ihre Umsatzsteuer-Identifikationsnummer:';
        EmailText: Label 'E-Mail:';
        FirstAccordingtoTextBody: Label 'Gemäß Satzung § 6 Absatz 2 fällt bei Erwerb der %1 -ein einmaliges Beitragsgeld in Höhe von';
        // FirstAccordingtoTextBody: Text[550];
        EndAccordingTextBody: Label 'an. Das Leistungdatum entspricht dem Eintrittjahr.';
        FirstPleaseBody: Label 'Bitte überwisen Sie den oben genannten Betrag unter Angabe der Rechnungsnummer %1 bis spätestens %2 auf unsere Konto bei der %3,SWIFT-BIC:%4,IBAN %5.';
        EndTaxTextBody: Label 'Unsere Steuer-Nummer beim Finanzamt %1 lautet:';
        EndTextBody: Label 'Dieses Schreiben dient als Buchungsbeleg.';
        CompanyCompletAddress: Text[250];
        SWIFTCode: Record "SWIFT Code";
        CompanyAnschrift: text[250];
        Beitrittsgeld: Label 'Beitrittsgeld für den Erwerb der %1 im Jahr %2';
        BeitrittsgeldCaption: text[250];
        // BeitrittsDescription: Option "Beitrittsgeld","Beitragsrechnung Geschäftsjahr","Beitragsrechnung Wärmezählerprogramm","Beitragsrechnung Gemeinschaftsforschungsprojekt";
        BeitrittsDescription: Text[100];
        MemberInvoiceAmount: Decimal;
        MemberInvoiceAmountGeschäftsjahr: Decimal;
        MemberInvoiceAmountWärmezähler: Decimal;
        MemberInvoiceAmountGemeinschaft: Decimal;




    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        CompanyInfo.Get();
        SWIFTCode.GET(CompanyInfo."SWIFT Code");
    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
    end;
}
