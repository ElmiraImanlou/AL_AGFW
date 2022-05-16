report 50201 "Price Of Sales Invoice"
{

    //Note 53
    DefaultLayout = RDLC;
    // RDLCLayout = './MitgliedVerwaltung/PriceOfSalesInvoice2.rdlc';
    RDLCLayout = './MitgliedVerwaltung/Reports/PriceOfSalesInvoiceOrg.rdlc';
    Caption = 'Sales - Invoice';
    EnableHyperlinks = true;
    Permissions = TableData "Sales Shipment Buffer" = rimd;
    PreviewMode = PrintLayout;
    ObsoleteReason = 'Replaced with report 1306 Standard Sales - Invoice';
    ObsoleteState = Pending;
    ObsoleteTag = '15.2';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Posted Sales Invoice';
            column(No_SalesInvHdr; "No.")
            {
            }
            column(EMailCaption; EMailCaptionLbl)
            {
            }
            column(Cust_USTID; Cust."VAT Registration No.")
            {

            }
            // column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
            // {
            // }
            // column(VATCaption; VATCaptionLbl)
            // {
            // }
            // column(VATBaseCaption; VATBaseCaptionLbl)
            // {
            // }
            // column(VATAmountCaption; VATAmountCaptionLbl)
            // {
            // }
            // column(VATIdentifierCaption; VATIdentifierCaptionLbl)
            // {
            // }
            // column(TotalCaption; TotalCaptionLbl)
            // {
            // }
            // column(PaymentTermsCaption; PaymentTermsCaptionLbl)
            // {
            // }
            // column(ShipmentMethodCaption; ShipmentMethodCaptionLbl)
            // {
            // }
            // column(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
            // {
            // }
            // column(DocumentDateCaption; DocumentDateCaptionLbl)
            // {
            // }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {
            }

            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                    column(AddressManagement; AddressManagement.ContactFormatAddress(Contact))
                    {
                    }
                    column(TextTitel; TextTitel)
                    {

                    }
                    // column(YearCode; YearCode)
                    // {
                    // }
                    column(YearCode; "Sales Invoice Header".InvoiceYear)
                    {
                    }
                    column(TextBodyTotal; TextBodyTotal)
                    {

                    }
                    column(TextBodyHeader; TextBodyHeader)
                    {

                    }
                    column(TextBodyEnd; TextBodyEnd)
                    {

                    }
                    column(TextBodyFooter; TextBodyFooter)
                    {
                    }
                    column(ItemNo_BodyText; BodyText.ItemNo)
                    {
                    }
                    column(ItemDescription_BodyText; BodyText.ItemDescription)
                    {
                    }
                    column(LineNo_BodyText; BodyText.LineNo)
                    {
                    }
                    column(MemberType_BodyText; BodyText.MemberType)
                    {
                    }
                    column(TextBody_BodyText; BodyText.TextBody)
                    {
                    }

                    column(TextPosition_BodyText; BodyText.TextPosition)
                    {
                    }
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(Caption; Caption)
                    {

                    }
                    column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                    {

                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfo3Picture; CompanyInfo3.Picture)
                    {
                    }
                    column(DocumentCaptionCopyText; StrSubstNo(DocumentCaption, CopyText))
                    {
                    }
                    column(CustAddr1; CustAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(CustAddr2; CustAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(CustAddr3; CustAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(CustAddr4; CustAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(CustAddr5; CustAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(CustAddr6; CustAddr[6])
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
                    column(OrderNo; OrderNo)
                    {
                    }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfoExtraAddress1; CompanyInfo.ExtraAddress)
                    {

                    }

                    column(CompanyInfoExtraCity; CompanyInfo."Extra City")
                    {

                    }

                    column(CompanyInfoExtrPLZ; CompanyInfo."Extra Post Code")
                    {

                    }

                    column(CompanyInfoVereinsregistergericht; CompanyInfo.Vereinsregistergericht)
                    {

                    }

                    column(CompanyInfoManager; CompanyInfo."Managing directors")
                    {

                    }

                    column(CompanyInfoPresident; CompanyInfo."President of the Association")
                    {

                    }

                    column(PaymentTermsDescription; PaymentTerms.Description)
                    {
                    }
                    column(ShipmentMethodDescription; ShipmentMethod.Description)
                    {
                    }
                    column(BillToCustNo_SalesInvHdr; "Sales Invoice Header"."Bill-to Customer No.")
                    {
                    }
                    column(PostingDate_SalesInvHdr; Format("Sales Invoice Header"."Posting Date", 0, 4))
                    {
                    }
                    column(VATNoText; VATNoText)
                    {
                    }
                    column(VATRegNo_SalesInvHeader; "Sales Invoice Header"."VAT Registration No.")
                    {
                    }
                    column(DueDate_SalesInvHeader; Format("Sales Invoice Header"."Due Date", 0, 4))
                    {
                    }
                    column(SalesPersonText; SalesPersonText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourReference_SalesInvHdr; "Sales Invoice Header"."Your Reference")
                    {
                    }
                    column(OrderNoText; OrderNoText)
                    {
                    }
                    column(OrderNo_SalesInvHeader; "Sales Invoice Header"."Order No.")
                    {
                    }
                    column(CustAddr7; CustAddr[7])
                    {
                    }
                    column(CustAddr8; CustAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(DocDate_SalesInvoiceHdr; Format("Sales Invoice Header"."Document Date", 0, 4))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdr; "Sales Invoice Header"."Prices Including VAT")
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PricesInclVATYesNo; Format("Sales Invoice Header"."Prices Including VAT"))
                    {
                    }
                    column(PageCaption; PageCaptionCap)
                    {
                    }
                    column(CompanyInfoRegNo; CompanyInfo.GetRegistrationNumber)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(BankAccountNoCaption; BankAccountNoCaptionLbl)
                    {
                    }
                    column(DueDateCaption; DueDateCaptionLbl)
                    {
                    }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl)
                    {
                    }
                    column(PostingDateCaption; PostingDateCaptionLbl)
                    {
                    }
                    column(RegNoCaption; CompanyInfo.GetRegistrationNumberLbl)
                    {
                    }
                    column(BillToCustNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Bill-to Customer No."))
                    {
                    }
                    column(PricesInclVAT_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Prices Including VAT"))
                    {
                    }
                    column(CompanyInfo; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo.Picture)
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

                    column(CompanyInfoIBAN; CompanyInfo.IBAN)
                    {
                    }
                    column(CompanyInfoRegNumber; CompanyInfo."Registration No.")
                    {
                    }
                    column(DocumentNo; DocumentNo)
                    {

                    }
                    // column(CompanyInfoSWIFTCode; SWIFTCode.Name)
                    // {
                    // }
                    column(CompanyInfoSWIFTCode; CompanyInfo."SWIFT Code")
                    {
                    }
                    column(CompanyAnschrift; CompanyAnschrift)
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

                    column(MemberNo_Caption; MemberNo_Caption)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));

                        column(DimText; DimText)
                        {
                        }
                        column(Number_Integer; Number)
                        {
                        }
                        column(DimensionsCaption; DimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;
                        end;
                    }

                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(LineAmt_SalesInvoiceLine; "Line Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(Description_SalesInvLine; Description)
                        {
                        }
                        column(No_SalesInvoiceLine; "No.")
                        {
                        }
                        column(Quantity_SalesInvoiceLine; Quantity)
                        {
                        }
                        column(UOM_SalesInvoiceLine; "Unit of Measure")
                        {
                        }
                        column(UnitPrice_SalesInvLine; "Unit Price")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 2;
                        }
                        column(LineDisc_SalesInvoiceLine; "Line Discount %")
                        {
                        }
                        column(VATIdent_SalesInvLine; "VAT Identifier")
                        {
                        }
                        column(PostedShipmentDate; Format("Shipment Date"))
                        {
                        }
                        column(SalesLineType; Format("Sales Invoice Line".Type))
                        {
                        }
                        column(InvDiscountAmount; -"Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvoiceDiscountAmt; TotalInvoiceDiscountAmt)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(Amount_SalesInvoiceLine; Amount)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(TotalAmount; TotalAmount)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(AmountIncludingVATAmount; "Amount Including VAT" - Amount)
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(AmtInclVAT_SalesInvLine; "Amount Including VAT")
                        {
                            AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(TotalAmountInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmountVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATBaseDisc_SalesInvHdr; "Sales Invoice Header"."VAT Base Discount %")
                        {
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscountOnVAT; TotalPaymentDiscountOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(LineNo_SalesInvoiceLine; "Line No.")
                        {
                        }
                        column(UnitPriceCaption; UnitPriceCaptionLbl)
                        {
                        }
                        column(DiscountCaption; DiscountCaptionLbl)
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(PostedShipmentDateCaption; PostedShipmentDateCaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(PaymentDiscVATCaption; PaymentDiscVATCaptionLbl)
                        {
                        }
                        column(Description_SalesInvLineCaption; FieldCaption(Description))
                        {
                        }
                        column(No_SalesInvoiceLineCaption; FieldCaption("No."))
                        {
                        }
                        column(Quantity_SalesInvoiceLineCaption; FieldCaption(Quantity))
                        {
                        }
                        column(UOM_SalesInvoiceLineCaption; FieldCaption("Unit of Measure"))
                        {
                        }
                        column(VATIdent_SalesInvLineCaption; FieldCaption("VAT Identifier"))
                        {
                        }
                        column(IsLineWithTotals; LineNoWithTotal = "Line No.")
                        {
                        }
                        column(InvoiceCaption; InvoiceCaption)
                        {

                        }

                        column(MemberNo; MemberNo)
                        {

                        }
                        column(MemberType; MemberType)
                        {

                        }
                        column(WOBTJ; WOBTJ)
                        {

                        }
                        column(WOB_OrderNo; WOB_OrderNo)
                        {

                        }
                        column(AmountCalc; AmountCalc)
                        {

                        }

                        trigger OnAfterGetRecord()
                        var
                        // NewLine: Text;



                        begin

                            If Member.Get("Sales Invoice Header"."Sell-to Contact No.") then begin

                                MemberNo := Member."No.";
                                MemberType := Member."Members Type";

                                // HistoryYear.SetFilter(Year, YearCode);

                                HistoryYear.SetFilter(Year, "Sales Invoice Header".InvoiceYear);
                                HistoryYear.SetFilter(MemberType, Member."Members Type");
                                HistoryYear.SetFilter(ContactNo, "Sales Invoice Header"."Sell-to Contact No.");
                                HistoryYear.SetFilter(MemberNo, MemberNo);

                                if HistoryYear.FindFirst() then begin
                                    WOBTJ := HistoryYear.WOB;
                                    Case "Sales Invoice Line".Description of
                                        'Beitragsrechnung Gemeinschaftsforschungsprojekt'://FUE
                                            begin
                                                WOB_OrderNo := HistoryYear.OrderNo_FUE;
                                                AmountCalc := HistoryYear.AmountCalcFUE;

                                            end;
                                        'Beitrittsgeld'://WOB
                                            begin
                                                WOB_OrderNo := HistoryYear.OrderNo_WOB;
                                                AmountCalc := HistoryYear.AmountCalc;

                                            end;
                                        'Beitragsrechnung Wärmezählerprogramm'://WZP
                                            begin
                                                WOB_OrderNo := HistoryYear.OrderNo_WZP;
                                                AmountCalc := HistoryYear.AmountCalcWZP;

                                            end;
                                        'Beitragsrechnung Geschäftsjahr'://WOB
                                            begin

                                                WOB_OrderNo := HistoryYear.OrderNo_WOB;
                                                AmountCalc := HistoryYear.AmountCalc;
                                            end;
                                    End
                                end else
                                    ;
                            end else
                                ;


                            NewLine[1] := 10;

                            SalesInvoiceNo := "Sales Invoice Line"."No.";
                            BodyText.SetFilter(ItemNo, SalesInvoiceNo);
                            BodyText.SetFilter(ItemDescription, "Sales Invoice Line".Description);
                            if not BodyText.FindSet() then
                                Message('Gibt es nicht.')
                            else
                                repeat
                                    Case Format(BodyText.TextPosition) of
                                        'TITEL':
                                            begin
                                                If "Sales Invoice Line".Description = 'Beitrittsgeld' then
                                                    TextTitel := StrSubstNo(BodyText.TextBody, MemberType, "Sales Invoice Header".InvoiceYear) + NewLine
                                                else
                                                    TextTitel := StrSubstNo(BodyText.TextBody, BodyText.ItemDescription, "Sales Invoice Header".InvoiceYear) + NewLine;
                                            end;
                                        'BODYHEADER':
                                            begin
                                                If "Sales Invoice Line".Description <> 'Beitragsrechnung Wärmezählerprogramm' then
                                                    TextBodyHeader += NewLine + StrSubstNo(BodyText.TextBody, BodyText.MemberType, Format("Sales Invoice Header"."Document Date"), "Sales Invoice Line"."Unit of Measure Code", Format(WOBTJ)) + NewLine
                                                else
                                                    TextBodyHeader += StrSubstNo(BodyText.TextBody, BodyText.MemberType, Format("Sales Invoice Header"."Document Date"), "Sales Invoice Line"."Unit of Measure Code", Format(WOBTJ)) + NewLine;
                                            end;
                                        'BODYFOOTER':
                                            begin
                                                TextBodyFooter += NewLine + NewLine + StrSubstNo(BodyText.TextBody,
                                                "Sales Invoice Header"."No.", Format("Sales Invoice Header"."Document Date"),
                                                 CompanyInfo."Bank Name", 'SWIFT-BIC', CompanyInfo."SWIFT Code", 'IBAN', CompanyInfo.IBAN,
                                                  "Sales Invoice Line"."Unit of Measure Code", NewLine + NewLine, '                                                          ', System.Round(AmountCalc), '€', ('(anteilig für das Jahr ' + "Sales Invoice Header".InvoiceYear + ')')) + NewLine;// "%9 =newline"
                                            end;
                                        'BODYEND':
                                            begin
                                                TextBodyEnd += NewLine + NewLine + BodyText.TextBody;
                                            end;
                                    End;
                                until BodyText.Next() = 0;


                        end;


                    }

                    dataitem("Sales Shipment Buffer"; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(SalesShpBufferPostingDate; Format(SalesShipmentBuffer."Posting Date"))
                        {
                        }
                        column(SalesShpBufferQuantity; SalesShipmentBuffer.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(ShipmentCaption; ShipmentCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then
                                SalesShipmentBuffer.Find('-')
                            else
                                SalesShipmentBuffer.Next;
                        end;

                        trigger OnPreDataItem()
                        begin
                            SalesShipmentBuffer.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                            SalesShipmentBuffer.SetRange("Line No.", "Sales Invoice Line"."Line No.");

                            SetRange(Number, 1, SalesShipmentBuffer.Count);
                        end;
                    }
                    dataitem(DimensionLoop2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText_DimensionLoop2; DimText)
                        {
                        }
                        column(LineDimensionsCaption; LineDimensionsCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry2.FindSet then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry2.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;

                            DimSetEntry2.SetRange("Dimension Set ID", "Sales Invoice Line"."Dimension Set ID");
                        end;
                    }
                    dataitem(AsmLoop; "Integer")
                    {
                        column(TempPostedAsmLineUOMCode; GetUOMText(TempPostedAsmLine."Unit of Measure Code"))
                        {
                        }
                        column(TempPostedAsmLineQuantity; TempPostedAsmLine.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(TempPostedAsmLineVariantCode; BlanksForIndent + TempPostedAsmLine."Variant Code")
                        {
                        }
                        column(TempPostedAsmLineDesc; BlanksForIndent + TempPostedAsmLine.Description)
                        {
                        }
                        column(TempPostedAsmLineNo; BlanksForIndent + TempPostedAsmLine."No.")
                        {
                        }

                        trigger OnAfterGetRecord()
                        var
                            ItemTranslation: Record "Item Translation";
                        begin
                            if Number = 1 then
                                TempPostedAsmLine.FindSet
                            else
                                TempPostedAsmLine.Next;

                            if ItemTranslation.Get(TempPostedAsmLine."No.",
                                 TempPostedAsmLine."Variant Code",
                                 "Sales Invoice Header"."Language Code")
                            then
                                TempPostedAsmLine.Description := ItemTranslation.Description;
                        end;

                        trigger OnPreDataItem()
                        var
                            PostedAssemblyLine: Record "Posted Assembly Line";
                            DummyValueEntry: Record "Value Entry";
                        begin
                            Clear(TempPostedAsmLine);
                            if not DisplayAssemblyInformation then
                                CurrReport.Break;
                            PostedAssemblyLine.GetAssemblyLinesForDocument(
                              TempPostedAsmLine, DummyValueEntry."Document Type"::"Sales Invoice",
                              "Sales Invoice Line"."Document No.", "Sales Invoice Line"."Line No.");
                            Clear(TempPostedAsmLine);
                            SetRange(Number, 1, TempPostedAsmLine.Count);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin
                        InitializeShipmentBuffer;

                        // if (Type = Type::"G/L Account") and (not ShowInternalInfo) then
                        //     "No." := '';

                        VATAmountLine.Init;
                        // VATAmountLine."VAT Identifier" := "VAT Identifier";
                        // VATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                        // VATAmountLine."Tax Group Code" := "Tax Group Code";
                        // VATAmountLine."VAT %" := "VAT %";
                        // VATAmountLine."VAT Base" := Amount;
                        // VATAmountLine."Amount Including VAT" := "Amount Including VAT";
                        // VATAmountLine."Line Amount" := "Line Amount";
                        // if "Allow Invoice Disc." then
                        // VATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                        // VATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                        // VATAmountLine."VAT Clause Code" := "VAT Clause Code";
                        // VATAmountLine.InsertLine;
                        // CalcVATAmountLineLCY(
                        //   "Sales Invoice Header", VATAmountLine, TempVATAmountLineLCY,
                        //   VATBaseRemainderAfterRoundingLCY, AmtInclVATRemainderAfterRoundingLCY);

                        // TotalSubTotal += "Line Amount";
                        // TotalInvoiceDiscountAmt -= "Inv. Discount Amount";
                        // TotalAmount += Amount;
                        // TotalAmountVAT += "Amount Including VAT" - Amount;
                        // TotalAmountInclVAT += "Amount Including VAT";
                        // TotalPaymentDiscountOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");
                    end;

                    trigger OnPreDataItem()
                    begin
                        VATAmountLine.DeleteAll;
                        TempVATAmountLineLCY.DeleteAll;
                        VATBaseRemainderAfterRoundingLCY := 0;
                        AmtInclVATRemainderAfterRoundingLCY := 0;
                        SalesShipmentBuffer.Reset;
                        SalesShipmentBuffer.DeleteAll;
                        FirstValueEntryNo := 0;
                        MoreLines := Find('+');
                        // while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                        //     MoreLines := Next(-1) <> 0;
                        // if not MoreLines then
                        //     CurrReport.Break;
                        // LineNoWithTotal := "Line No.";
                        // SetRange("Line No.", 0, "Line No.");
                    end;
                }

                dataitem(VATCounter; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(VATAmountLineVATBase; VATAmountLine."VAT Base")
                    {
                        AutoFormatExpression = "Sales Invoice Line".GetCurrencyCode;
                        AutoFormatType = 1;
                    }
                    column(VATAmountLineVATAmount; VATAmountLine."VAT Amount")
                    {
                        AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmountLineLineAmount; VATAmountLine."Line Amount")
                    {
                        AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                    {
                        AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmtLineInvDiscountAmt; VATAmountLine."Invoice Discount Amount")
                    {
                        AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATAmountLineVAT; VATAmountLine."VAT %")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(VATAmtLineVATIdentifier; VATAmountLine."VAT Identifier")
                    {
                    }
                    column(VATAmntSpecificCaption; VATAmntSpecificCaptionLbl)
                    {
                    }
                    column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl)
                    {
                    }
                    column(LineAmountCaption; LineAmountCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, VATAmountLine.Count);
                    end;
                }
                dataitem(VATClauseEntryCounter; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(VATClauseVATIdentifier; VATAmountLine."VAT Identifier")
                    {
                    }
                    column(VATClauseCode; VATAmountLine."VAT Clause Code")
                    {
                    }
                    column(VATClauseDescription; VATClause.Description)
                    {
                    }
                    column(VATClauseDescription2; VATClause."Description 2")
                    {
                    }
                    column(VATClauseAmount; VATAmountLine."VAT Amount")
                    {
                        AutoFormatExpression = "Sales Invoice Header"."Currency Code";
                        AutoFormatType = 1;
                    }
                    column(VATClausesCaption; VATClausesCap)
                    {
                    }
                    column(VATClauseVATIdentifierCaption; VATIdentifierCaptionLbl)
                    {
                    }
                    column(VATClauseVATAmtCaption; VATAmountCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        VATAmountLine.GetLine(Number);
                        if not VATClause.Get(VATAmountLine."VAT Clause Code") then
                            CurrReport.Skip;
                        VATClause.GetDescription("Sales Invoice Header");
                    end;

                    trigger OnPreDataItem()
                    begin
                        Clear(VATClause);
                        SetRange(Number, 1, VATAmountLine.Count);
                    end;
                }
                dataitem(VatCounterLCY; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(VALSpecLCYHeader; VALSpecLCYHeader)
                    {
                    }
                    column(VALExchRate; VALExchRate)
                    {
                    }
                    column(VALVATBaseLCY; VALVATBaseLCY)
                    {
                        AutoFormatType = 1;
                    }
                    column(VALVATAmountLCY; VALVATAmountLCY)
                    {
                        AutoFormatType = 1;
                    }
                    column(VATAmountLineVAT_VatCounterLCY; TempVATAmountLineLCY."VAT %")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(VATAmtLineVATIdentifier_VatCounterLCY; TempVATAmountLineLCY."VAT Identifier")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        TempVATAmountLineLCY.GetLine(Number);
                        VALVATBaseLCY := TempVATAmountLineLCY."VAT Base";
                        VALVATAmountLCY := TempVATAmountLineLCY."Amount Including VAT" - TempVATAmountLineLCY."VAT Base";
                    end;

                    trigger OnPreDataItem()
                    begin
                        if (not GLSetup."Print VAT specification in LCY") or
                           ("Sales Invoice Header"."Currency Code" = '')
                        then
                            CurrReport.Break;

                        SetRange(Number, 1, VATAmountLine.Count);
                        Clear(VALVATBaseLCY);
                        Clear(VALVATAmountLCY);

                        if GLSetup."LCY Code" = '' then
                            VALSpecLCYHeader := Text007 + Text008
                        else
                            VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                        CurrExchRate.FindCurrency("Sales Invoice Header"."Posting Date", "Sales Invoice Header"."Currency Code", 1);
                        CalculatedExchRate := Round(1 / "Sales Invoice Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                        VALExchRate := StrSubstNo(Text009, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                    end;
                }
                dataitem(PaymentReportingArgument; "Payment Reporting Argument")
                {
                    DataItemTableView = SORTING(Key);
                    UseTemporary = true;
                    column(PaymentServiceLogo; Logo)
                    {
                    }
                    column(PaymentServiceURLText; "URL Caption")
                    {
                    }
                    column(PaymentServiceURL; GetTargetURL)
                    {
                    }

                    trigger OnPreDataItem()
                    var
                        PaymentServiceSetup: Record "Payment Service Setup";
                    begin
                        PaymentServiceSetup.CreateReportingArgs(PaymentReportingArgument, "Sales Invoice Header");
                        if IsEmpty then
                            CurrReport.Break;
                    end;
                }
                dataitem(Total; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                }
                dataitem(Total2; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(SellToCustNo_SalesInvHdr; "Sales Invoice Header"."Sell-to Customer No.")
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(ShipToAddressCaption; ShipToAddressCaptionLbl)
                    {
                    }
                    column(SellToCustNo_SalesInvHdrCaption; "Sales Invoice Header".FieldCaption("Sell-to Customer No."))
                    {
                    }

                    trigger OnPreDataItem()
                    begin
                        if not ShowShippingAddr then
                            CurrReport.Break;
                    end;
                }
                dataitem(LineFee; "Integer")
                {
                    DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = FILTER(1 ..));
                    column(LineFeeCaptionLbl; TempLineFeeNoteOnReportHist.ReportText)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if not DisplayAdditionalFeeNote then
                            CurrReport.Break;

                        if Number = 1 then begin
                            if not TempLineFeeNoteOnReportHist.FindSet then
                                CurrReport.Break
                        end else
                            if TempLineFeeNoteOnReportHist.Next = 0 then
                                CurrReport.Break;
                    end;
                }
                dataitem(AdvancePaymentEntries; "Cust. Ledger Entry")
                {
                    DataItemTableView = SORTING("Document No.", "Document Type", "Customer No.") ORDER(Ascending);
                    dataitem(DtldAdvancePaymentEntries; "Detailed Cust. Ledg. Entry")
                    {
                        DataItemLink = "Cust. Ledger Entry No." = FIELD("Entry No."), "Posting Date" = FIELD("Posting Date");
                        DataItemTableView = SORTING("Cust. Ledger Entry No.", "Entry Type", "Posting Date") ORDER(Ascending) WHERE("Entry Type" = CONST(Application));
                        column(APTReceivedAdvancePaymentsCaption; APTReceivedAdvancePaymentsCaptionLbl)
                        {
                        }
                        column(APTDateCaption; APTDateCaptionLbl)
                        {
                        }
                        column(APTDocumentNoCaption; APTDocumentNoCaptionLbl)
                        {
                        }
                        column(APTDescriptionCaption; APTDescriptionCaptionLbl)
                        {
                        }
                        column(APTVATPercentCaption; APTVATPercentCaptionLbl)
                        {
                        }
                        column(APTAmountCaption; APTAmountCaptionLbl)
                        {
                        }
                        column(APTVATBaseCaption; APTVATBaseCaptionLbl)
                        {
                        }
                        column(APTVATAmountCaption; APTVATAmountCaptionLbl)
                        {
                        }
                        dataitem(AdvPmtVATCounter; "Integer")
                        {
                            DataItemTableView = SORTING(Number);
                            column(Number_AdvPmtVATCounter; AdvPmtVATCounter.Number)
                            {
                            }
                            column(AdvPmtCLE_PostingDate; AdvPmtCLE."Posting Date")
                            {
                            }
                            column(AdvPmtCLE_DocumentNo; AdvPmtCLE."Document No.")
                            {
                            }
                            column(AdvPmtCLE_Description; AdvPmtCLE.Description)
                            {
                            }
                            column(TempVATAmountLine_VATPercent; TempVATAmountLine."VAT %")
                            {
                            }
                            column(TempVATAmountLine_AmountIncludingVAT; TempVATAmountLine."Amount Including VAT")
                            {
                            }
                            column(TempVATAmountLine_VATBase; TempVATAmountLine."VAT Base")
                            {
                            }
                            column(TempVATAmountLine_VATAmount; TempVATAmountLine."VAT Amount")
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                // >> #APTW17.00:A001
                                TempVATAmountLine.GetLine(Number);
                                // << #APTW17.00:A001
                            end;

                            trigger OnPreDataItem()
                            begin
                                // >> #APTW17.00:A001
                                if (TempVATAmountLine.Count = 0) or (not FoundAdvPmt) then
                                    CurrReport.Break;
                                SetRange(Number, 1, TempVATAmountLine.Count);
                                // << #APTW17.00:A001
                            end;
                        }

                        trigger OnAfterGetRecord()
                        var
                            VATEntry: Record "VAT Entry";
                            VPS: Record "VAT Posting Setup";
                        begin
                            // >> #APTW17.00:A001
                            Clear(TempVATAmountLine);
                            TempVATAmountLine.DeleteAll;

                            FoundAdvPmt := true;
                            AdvPmtRemAmt := Amount;
                            AdvPmtCLE.Get("Applied Cust. Ledger Entry No.");
                            // if AdvPmtCLE."Advance Payment Type" = AdvPmtCLE."Advance Payment Type"::"Alloc. Adv. Paym. Req. Sale" then
                            //     CurrReport.Skip;

                            if "Currency Code" = '' then begin
                                VATEntry.SetRange("Posting Date", AdvPmtCLE."Posting Date");
                                VATEntry.SetRange("Document No.", AdvPmtCLE."Document No.");
                                VATEntry.SetRange("Document Type", VATEntry."Document Type"::Payment);
                                VATEntry.SetRange(Type, VATEntry.Type::Sale);
                                VATEntry.SetRange("Transaction No.", AdvPmtCLE."Transaction No." - 1);
                                // >> #APTW114.00.03.02:T503
                                // if APTSetupSale."Allocate Payment Discount" then
                                // ;
                                // VATEntry.SETFILTER("Adv. Payment Sequential No.", '<> 9');
                                // << #APTW114.00.03.02:T503
                                if VATEntry.Find('-') then
                                    repeat
                                        VPS.Get(VATEntry."VAT Bus. Posting Group", VATEntry."VAT Prod. Posting Group");
                                        TempVATAmountLine.Init;
                                        TempVATAmountLine."VAT Identifier" := VPS."VAT Identifier";
                                        TempVATAmountLine."VAT Calculation Type" := VPS."VAT Calculation Type";
                                        TempVATAmountLine."VAT %" := VPS."VAT %";
                                        TempVATAmountLine."VAT Base" := VATEntry.Base;
                                        TempVATAmountLine."VAT Amount" := VATEntry.Amount;
                                        TempVATAmountLine."Amount Including VAT" := VATEntry.Base + VATEntry.Amount;
                                        TempVATAmountLine.InsertLine;
                                    until VATEntry.Next = 0;
                            end else begin
                                VPS.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group");
                                TempVATAmountLine.Init;
                                TempVATAmountLine."VAT Identifier" := VPS."VAT Identifier";
                                TempVATAmountLine."VAT Calculation Type" := VPS."VAT Calculation Type";
                                TempVATAmountLine."VAT %" := VPS."VAT %";
                                TempVATAmountLine."VAT Base" := DtldAdvancePaymentEntries.Amount; // VATEntry.Base;
                                TempVATAmountLine."VAT Amount" := 0;                              // VATEntry.Amount;
                                TempVATAmountLine."Amount Including VAT" := VATEntry.Base + VATEntry.Amount;
                                TempVATAmountLine.InsertLine;
                            end;
                            // << #APTW17.00:A001
                        end;

                        trigger OnPreDataItem()
                        begin
                            // >> #APTW17.00:A001
                            SetRange("Transaction No.", AdvancePaymentEntries."Transaction No." + 2);
                            // << #APTW17.00:A001
                        end;
                    }

                    trigger OnPreDataItem()
                    begin
                        // >> #APTW17.00:A001
                        FoundAdvPmt := false;
                        // with "Sales Invoice Header" do begin
                        //     if not ("Advance Payment" and ("Advance Payment Type" in ["Advance Payment Type"::"Partial Invoice Sale",
                        //                                                               "Advance Payment Type"::"Closing Invoice Sale"]))
                        //     then
                        //         CurrReport.Break;
                        // end;

                        SetRange("Customer No.", "Sales Invoice Header"."Bill-to Customer No.");
                        SetRange("Posting Date", "Sales Invoice Header"."Posting Date");
                        SetRange("Document Type", "Document Type"::Invoice);
                        SetRange("Document No.", "Sales Invoice Header"."No.");
                        SetRange("Sell-to Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                        // SetRange("Advance Payment", "Sales Invoice Header"."Advance Payment");
                        // SetRange("Advance Payment No.", "Sales Invoice Header"."Advance Payment No.");
                        // SetRange("Advance Payment Type", "Sales Invoice Header"."Advance Payment Type");
                        // << #APTW17.00:A001

                        // >> #APTW114.00.03.02:T503
                        // if not APTSetupSale.GET() then
                        //     APTSetupSale.init();
                        // << #APTW114.00.03.02:T503
                    end;
                }



                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;

                    TotalSubTotal := 0;
                    TotalInvoiceDiscountAmt := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscountOnVAT := 0;
                end;

                trigger OnPostDataItem()
                begin
                    // if not IsReportInPreviewMode then
                    //     CODEUNIT.Run(CODEUNIT::"Sales Inv.-Printed", "Sales Invoice Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfLoops := Abs(NoOfCopies) + Cust."Invoice Copies" + 1;
                    if NoOfLoops <= 0 then
                        NoOfLoops := 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;


            }

            trigger OnAfterGetRecord()
            var
                Handled: Boolean;
            begin
                Contact.Get("Sales Invoice Header"."Sell-to Contact No.");

                CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Sales Invoice Header");
                FormatDocumentFields("Sales Invoice Header");

                if not Cust.Get("Bill-to Customer No.") then
                    Clear(Cust);

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");

                GetLineFeeNoteOnReportHist("No.");

                OnAfterGetRecordSalesInvoiceHeader("Sales Invoice Header");
                OnGetReferenceText("Sales Invoice Header", ReferenceText, Handled);

                //********************************************** New Code


                // CompanyCompletAddress := CompanyInfo.Name + '|' + CompanyInfo."Address 2" + '|' + CompanyInfo."Post Code" + ' ' + CompanyInfo.City;
                // CompanyAnschrift := CompanyInfo.Name + '|' + CompanyInfo.Address + CompanyInfo."Address 2" + CompanyInfo."Post Code" + ' ' + CompanyInfo.City;
                NewLine[1] := 10;
                CompanyCompletAddress := CompanyInfo.Name + '|' + 'Postfach' + CompanyInfo."Post Office Box" + CompanyInfo."Post Code" + ' ' + CompanyInfo.City;
                CompanyAnschrift := CompanyInfo.Name + '|' + CompanyInfo."Name 2" + NewLine + 'Postfach  ' + CompanyInfo."Office Postcode" + NewLine + CompanyInfo."Post Code" + ' ' + CompanyInfo.City + NewLine + CompanyInfo.Address + CompanyInfo."Office Postcode" + CompanyInfo.City +
                NewLine + 'Telefon  ' + CompanyInfo."Phone No." + NewLine + 'Telefax  ' + CompanyInfo."Fax No." + NewLine + CompanyInfo."E-Mail" + NewLine + CompanyInfo."Home Page";//("Office Postcode"=PlZ-Postfach )("Post Office Box"=Postfach) 

            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin

            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Sales Invoice Header");
            end;
        }

    }



    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies that interactions with the contact are logged.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        Caption = 'Show Assembly Components';
                        ToolTip = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                    field(DisplayAdditionalFeeNote; DisplayAdditionalFeeNote)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Additional Fee Note';
                        ToolTip = 'Specifies that any notes about additional fees are included on the document.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }


    labels
    {
    }

    trigger OnInitReport()
    begin
        GLSetup.Get;
        SalesSetup.Get;
        CompanyInfo.Get;
        CompanyInfo2.CalcFields(Picture);


        // BodyText.Get;
        CompanyInfo.VerifyAndSetPaymentInfo;
        FormatDocument.SetLogoPosition(SalesSetup."Logo Position on Documents", CompanyInfo1, CompanyInfo2, CompanyInfo3);

        OnAfterInitReport;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Sales Invoice Header".FindSet then
                repeat
                    if "Sales Invoice Header"."Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          SegManagement.SalesInvoiceInterDocType, "Sales Invoice Header"."No.", 0, 0, DATABASE::Contact,
                          "Sales Invoice Header"."Bill-to Contact No.", "Sales Invoice Header"."Salesperson Code",
                          "Sales Invoice Header"."Campaign No.", "Sales Invoice Header"."Posting Description", '')
                    else
                        SegManagement.LogDocument(
                          SegManagement.SalesInvoiceInterDocType, "Sales Invoice Header"."No.", 0, 0, DATABASE::Customer,
                          "Sales Invoice Header"."Bill-to Customer No.", "Sales Invoice Header"."Salesperson Code",
                          "Sales Invoice Header"."Campaign No.", "Sales Invoice Header"."Posting Description", '');
                until "Sales Invoice Header".Next = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        NewLine: Text;

        Text004: Label 'Sales - Invoice %1', Comment = '%1 = Document No.';
        PageCaptionCap: Label 'Page %1 of %2';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        SalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
        Cust: Record Customer;
        VATAmountLine: Record "VAT Amount Line" temporary;
        TempVATAmountLineLCY: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        CurrExchRate: Record "Currency Exchange Rate";
        TempPostedAsmLine: Record "Posted Assembly Line" temporary;
        VATClause: Record "VAT Clause";
        TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary;
        Language: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        OrderNoText: Text[80];
        SalesPersonText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        NextEntryNo: Integer;
        FirstValueEntryNo: Integer;
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        VALExchRate: Text[50];
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: Label 'Sales - Prepayment Invoice %1';
        OutputNo: Integer;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmt: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        PhoneNoCaptionLbl: Label 'Phone No.';
        HomePageCaptionLbl: Label 'Home Page';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccountNoCaptionLbl: Label 'Account No.';
        DueDateCaptionLbl: Label 'Due Date';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        DimensionsCaptionLbl: Label 'Header Dimensions';
        UnitPriceCaptionLbl: Label 'Unit Price';
        DiscountCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        VATClausesCap: Label 'VAT Clause';
        PostedShipmentDateCaptionLbl: Label 'Posted Shipment Date';
        SubtotalCaptionLbl: Label 'Subtotal';
        PaymentDiscVATCaptionLbl: Label 'Payment Discount on VAT';
        ShipmentCaptionLbl: Label 'Shipment';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATAmntSpecificCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Invoice Discount Base Amount';
        LineAmountCaptionLbl: Label 'Line Amount';
        ShipToAddressCaptionLbl: Label 'Ship-to Address';
        EMailCaptionLbl: Label 'E-Mail';
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        VATCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmountCaptionLbl: Label 'VAT Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        TotalCaptionLbl: Label 'Total';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        DocumentDateCaptionLbl: Label 'Document Date';
        DisplayAdditionalFeeNote: Boolean;
        LineNoWithTotal: Integer;
        VATBaseRemainderAfterRoundingLCY: Decimal;
        AmtInclVATRemainderAfterRoundingLCY: Decimal;
        Text5013500: Label 'Sales - Advance Payment Request %1';
        "--- TM glob. Vars. ---": Integer;
        LicPermission: Record "License Permission";
        // TMEngine: Codeunit "Text Module Engine";
        // TempTMLine: Record "Text Module Line Document" temporary;
        "--- APT glob. Vars. ---": Integer;
        // APTSetupSale: Record "Advance Payment Setup Sale";
        FoundAdvPmt: Boolean;
        AdvPmtCLE: Record "Cust. Ledger Entry";
        AdvPmtRemAmt: Decimal;
        TempVATAmountLine: Record "VAT Amount Line" temporary;
        APTReceivedAdvancePaymentsCaptionLbl: Label 'Received Advance Payments';
        APTDateCaptionLbl: Label 'Date';
        APTDocumentNoCaptionLbl: Label 'Document No.';
        APTDescriptionCaptionLbl: Label 'Description';
        APTVATPercentCaptionLbl: Label 'VAT %';
        APTAmountCaptionLbl: Label 'Amount';
        APTVATBaseCaptionLbl: Label 'VAT Base';
        APTVATAmountCaptionLbl: Label 'VAT Amount';

        //***************************** Labelss
        SalesHeader: Record "Sales Header";
        WOBTJ: Integer;

        WOB_OrderNo: Code[50];
        AmountCalc: Decimal;

        ContRegulation: record "Contribution Regulation";
        HistoryYear: Record "History Year";
        MemberNo: code[50];
        MemberType: Code[50];
        Member: Record Members;
        SalesInvoiceNo: Code[20];
        BodyTextTextPosition: Code[20];
        Regex: DotNet Regex;
        TextTitel: Text[250];
        TextBodyHeader: text[500];
        TextBodyTotal: text[500];
        TextBodyFooter: Text[500];
        TextBodyEnd: Text[250];
        YearCode: Code[50];
        Contact: Record Contact;
        BodyText: record "Body Entry Invoice Description";
        AddressManagement: Codeunit "Address Management";
        CompanyCompletAddress: Text[250];
        SWIFTCode: Record "SWIFT Code";
        CompanyAnschrift: text[250];
        Caption: Label 'WÄRME | KÄLTE | KWK';
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
        MemberNo_Caption: Label 'Ihre Mitgliedsnummer:';
        OrderNo: Label 'Ihre Bestellung/Auftrag:';
        YourTax: Label 'Ihre Umsatzsteuer-Identifikationsnummer:';
        EmailText: Label 'E-Mail:';
        InvoiceCaption: text[250];
    // Contact: record Contact;


    procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(4) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure InitializeShipmentBuffer()
    var
        SalesShipmentHeader: Record "Sales Shipment Header";
        TempSalesShipmentBuffer: Record "Sales Shipment Buffer" temporary;
    begin
        NextEntryNo := 1;
        if "Sales Invoice Line"."Shipment No." <> '' then
            if SalesShipmentHeader.Get("Sales Invoice Line"."Shipment No.") then
                exit;

        if "Sales Invoice Header"."Order No." = '' then
            exit;

        case "Sales Invoice Line".Type of
            "Sales Invoice Line".Type::Item:
                GenerateBufferFromValueEntry("Sales Invoice Line");
            "Sales Invoice Line".Type::"G/L Account", "Sales Invoice Line".Type::Resource,
          "Sales Invoice Line".Type::"Charge (Item)", "Sales Invoice Line".Type::"Fixed Asset":
                GenerateBufferFromShipment("Sales Invoice Line");
        end;

        SalesShipmentBuffer.Reset;
        SalesShipmentBuffer.SetRange("Document No.", "Sales Invoice Line"."Document No.");
        SalesShipmentBuffer.SetRange("Line No.", "Sales Invoice Line"."Line No.");
        if SalesShipmentBuffer.Find('-') then begin
            TempSalesShipmentBuffer := SalesShipmentBuffer;
            if SalesShipmentBuffer.Next = 0 then begin
                SalesShipmentBuffer.Get(
                  TempSalesShipmentBuffer."Document No.", TempSalesShipmentBuffer."Line No.", TempSalesShipmentBuffer."Entry No.");
                SalesShipmentBuffer.Delete;
                exit;
            end;
            SalesShipmentBuffer.CalcSums(Quantity);
            if SalesShipmentBuffer.Quantity <> "Sales Invoice Line".Quantity then begin
                SalesShipmentBuffer.DeleteAll;
                exit;
            end;
        end;
    end;

    local procedure GenerateBufferFromValueEntry(SalesInvoiceLine2: Record "Sales Invoice Line")
    var
        ValueEntry: Record "Value Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := SalesInvoiceLine2."Quantity (Base)";
        ValueEntry.SetCurrentKey("Document No.");
        ValueEntry.SetRange("Document No.", SalesInvoiceLine2."Document No.");
        ValueEntry.SetRange("Posting Date", "Sales Invoice Header"."Posting Date");
        ValueEntry.SetRange("Item Charge No.", '');
        ValueEntry.SetFilter("Entry No.", '%1..', FirstValueEntryNo);
        if ValueEntry.Find('-') then
            repeat
                if ItemLedgerEntry.Get(ValueEntry."Item Ledger Entry No.") then begin
                    if SalesInvoiceLine2."Qty. per Unit of Measure" <> 0 then
                        Quantity := ValueEntry."Invoiced Quantity" / SalesInvoiceLine2."Qty. per Unit of Measure"
                    else
                        Quantity := ValueEntry."Invoiced Quantity";
                    AddBufferEntry(
                      SalesInvoiceLine2,
                      -Quantity,
                      ItemLedgerEntry."Posting Date");
                    TotalQuantity := TotalQuantity + ValueEntry."Invoiced Quantity";
                end;
                FirstValueEntryNo := ValueEntry."Entry No." + 1;
            until (ValueEntry.Next = 0) or (TotalQuantity = 0);
    end;

    local procedure GenerateBufferFromShipment(SalesInvoiceLine: Record "Sales Invoice Line")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine2: Record "Sales Invoice Line";
        SalesShipmentHeader: Record "Sales Shipment Header";
        SalesShipmentLine: Record "Sales Shipment Line";
        TotalQuantity: Decimal;
        Quantity: Decimal;
    begin
        TotalQuantity := 0;
        SalesInvoiceHeader.SetCurrentKey("Order No.");
        SalesInvoiceHeader.SetFilter("No.", '..%1', "Sales Invoice Header"."No.");
        SalesInvoiceHeader.SetRange("Order No.", "Sales Invoice Header"."Order No.");
        if SalesInvoiceHeader.Find('-') then
            repeat
                SalesInvoiceLine2.SetRange("Document No.", SalesInvoiceHeader."No.");
                SalesInvoiceLine2.SetRange("Line No.", SalesInvoiceLine."Line No.");
                SalesInvoiceLine2.SetRange(Type, SalesInvoiceLine.Type);
                SalesInvoiceLine2.SetRange("No.", SalesInvoiceLine."No.");
                SalesInvoiceLine2.SetRange("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                if SalesInvoiceLine2.Find('-') then
                    repeat
                        TotalQuantity := TotalQuantity + SalesInvoiceLine2.Quantity;
                    until SalesInvoiceLine2.Next = 0;
            until SalesInvoiceHeader.Next = 0;

        SalesShipmentLine.SetCurrentKey("Order No.", "Order Line No.");
        SalesShipmentLine.SetRange("Order No.", "Sales Invoice Header"."Order No.");
        SalesShipmentLine.SetRange("Order Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SetRange("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentLine.SetRange(Type, SalesInvoiceLine.Type);
        SalesShipmentLine.SetRange("No.", SalesInvoiceLine."No.");
        SalesShipmentLine.SetRange("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
        SalesShipmentLine.SetFilter(Quantity, '<>%1', 0);

        if SalesShipmentLine.Find('-') then
            repeat
                if "Sales Invoice Header"."Get Shipment Used" then
                    CorrectShipment(SalesShipmentLine);
                if Abs(SalesShipmentLine.Quantity) <= Abs(TotalQuantity - SalesInvoiceLine.Quantity) then
                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity
                else begin
                    if Abs(SalesShipmentLine.Quantity) > Abs(TotalQuantity) then
                        SalesShipmentLine.Quantity := TotalQuantity;
                    Quantity :=
                      SalesShipmentLine.Quantity - (TotalQuantity - SalesInvoiceLine.Quantity);

                    TotalQuantity := TotalQuantity - SalesShipmentLine.Quantity;
                    SalesInvoiceLine.Quantity := SalesInvoiceLine.Quantity - Quantity;

                    if SalesShipmentHeader.Get(SalesShipmentLine."Document No.") then
                        AddBufferEntry(
                          SalesInvoiceLine,
                          Quantity,
                          SalesShipmentHeader."Posting Date");
                end;
            until (SalesShipmentLine.Next = 0) or (TotalQuantity = 0);
    end;

    local procedure CorrectShipment(var SalesShipmentLine: Record "Sales Shipment Line")
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
    begin
        SalesInvoiceLine.SetCurrentKey("Shipment No.", "Shipment Line No.");
        SalesInvoiceLine.SetRange("Shipment No.", SalesShipmentLine."Document No.");
        SalesInvoiceLine.SetRange("Shipment Line No.", SalesShipmentLine."Line No.");
        if SalesInvoiceLine.Find('-') then
            repeat
                SalesShipmentLine.Quantity := SalesShipmentLine.Quantity - SalesInvoiceLine.Quantity;
            until SalesInvoiceLine.Next = 0;
    end;

    local procedure AddBufferEntry(SalesInvoiceLine: Record "Sales Invoice Line"; QtyOnShipment: Decimal; PostingDate: Date)
    begin
        SalesShipmentBuffer.SetRange("Document No.", SalesInvoiceLine."Document No.");
        SalesShipmentBuffer.SetRange("Line No.", SalesInvoiceLine."Line No.");
        SalesShipmentBuffer.SetRange("Posting Date", PostingDate);
        if SalesShipmentBuffer.Find('-') then begin
            SalesShipmentBuffer.Quantity := SalesShipmentBuffer.Quantity + QtyOnShipment;
            SalesShipmentBuffer.Modify;
            exit;
        end;

        with SalesShipmentBuffer do begin
            "Document No." := SalesInvoiceLine."Document No.";
            "Line No." := SalesInvoiceLine."Line No.";
            "Entry No." := NextEntryNo;
            Type := SalesInvoiceLine.Type;
            "No." := SalesInvoiceLine."No.";
            Quantity := QtyOnShipment;
            "Posting Date" := PostingDate;
            Insert;
            NextEntryNo := NextEntryNo + 1
        end;
    end;

    local procedure DocumentCaption(): Text[250]
    var
        DocCaption: Text;
    begin
        OnBeforeGetDocumentCaption("Sales Invoice Header", DocCaption);
        if DocCaption <> '' then
            exit(DocCaption);
        // >> #APTW17.00:A001
        // if "Sales Invoice Header"."Advance Payment" and
        //    ("Sales Invoice Header"."Advance Payment Type" = "Sales Invoice Header"."Advance Payment Type"::"Advance Payment Request Sale")
        // then
        //     exit(Text5013500)
        // else
        // // << #APTW17.00:A001
        //     if "Sales Invoice Header"."Prepayment Invoice" then
        //         exit(Text010);

        exit(Text004);
    end;

    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; DisplayAsmInfo: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure FormatDocumentFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        with SalesInvoiceHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetSalesPerson(SalesPurchPerson, "Salesperson Code", SalesPersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");

            OrderNoText := FormatDocument.SetText("Order No." <> '', FieldCaption("Order No."));
            ReferenceText := FormatDocument.SetText("Your Reference" <> '', FieldCaption("Your Reference"));
            VATNoText := FormatDocument.SetText("VAT Registration No." <> '', FieldCaption("VAT Registration No."));
        end;
    end;

    local procedure FormatAddressFields(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        FormatAddr.GetCompanyAddr(SalesInvoiceHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.SalesInvBillTo(CustAddr, SalesInvoiceHeader);
        ShowShippingAddr := FormatAddr.SalesInvShipTo(ShipToAddr, CustAddr, SalesInvoiceHeader);
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[50]
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.Get(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    procedure BlanksForIndent(): Text[10]
    begin
        exit(PadStr('', 2, ' '));
    end;

    local procedure GetLineFeeNoteOnReportHist(SalesInvoiceHeaderNo: Code[20])
    var
        LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist.";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
    begin
        TempLineFeeNoteOnReportHist.DeleteAll;
        CustLedgerEntry.SetRange("Document Type", CustLedgerEntry."Document Type"::Invoice);
        CustLedgerEntry.SetRange("Document No.", SalesInvoiceHeaderNo);
        if not CustLedgerEntry.FindFirst then
            exit;

        if not Customer.Get(CustLedgerEntry."Customer No.") then
            exit;

        LineFeeNoteOnReportHist.SetRange("Cust. Ledger Entry No", CustLedgerEntry."Entry No.");
        LineFeeNoteOnReportHist.SetRange("Language Code", Customer."Language Code");
        if LineFeeNoteOnReportHist.FindSet then begin
            repeat
                InsertTempLineFeeNoteOnReportHist(LineFeeNoteOnReportHist, TempLineFeeNoteOnReportHist);
            until LineFeeNoteOnReportHist.Next = 0;
        end else begin
            LineFeeNoteOnReportHist.SetRange("Language Code", Language.GetUserLanguageCode);
            if LineFeeNoteOnReportHist.FindSet then
                repeat
                    InsertTempLineFeeNoteOnReportHist(LineFeeNoteOnReportHist, TempLineFeeNoteOnReportHist);
                until LineFeeNoteOnReportHist.Next = 0;
        end;
    end;

    local procedure CalcVATAmountLineLCY(SalesInvoiceHeader: Record "Sales Invoice Header"; TempVATAmountLine2: Record "VAT Amount Line" temporary; var TempVATAmountLineLCY2: Record "VAT Amount Line" temporary; var VATBaseRemainderAfterRoundingLCY2: Decimal; var AmtInclVATRemainderAfterRoundingLCY2: Decimal)
    var
        VATBaseLCY: Decimal;
        AmtInclVATLCY: Decimal;
    begin
        if (not GLSetup."Print VAT specification in LCY") or
           (SalesInvoiceHeader."Currency Code" = '')
        then
            exit;

        TempVATAmountLineLCY2.Init;
        TempVATAmountLineLCY2 := TempVATAmountLine2;
        with SalesInvoiceHeader do begin
            VATBaseLCY :=
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Posting Date", "Currency Code", TempVATAmountLine2."VAT Base", "Currency Factor") +
              VATBaseRemainderAfterRoundingLCY2;
            AmtInclVATLCY :=
              CurrExchRate.ExchangeAmtFCYToLCY(
                "Posting Date", "Currency Code", TempVATAmountLine2."Amount Including VAT", "Currency Factor") +
              AmtInclVATRemainderAfterRoundingLCY2;
        end;
        TempVATAmountLineLCY2."VAT Base" := Round(VATBaseLCY);
        TempVATAmountLineLCY2."Amount Including VAT" := Round(AmtInclVATLCY);
        TempVATAmountLineLCY2.InsertLine;

        VATBaseRemainderAfterRoundingLCY2 := VATBaseLCY - TempVATAmountLineLCY2."VAT Base";
        AmtInclVATRemainderAfterRoundingLCY2 := AmtInclVATLCY - TempVATAmountLineLCY2."Amount Including VAT";
    end;

    local procedure InsertTempLineFeeNoteOnReportHist(var LineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist."; var TempLineFeeNoteOnReportHist: Record "Line Fee Note on Report Hist." temporary)
    begin
        repeat
            TempLineFeeNoteOnReportHist.Init;
            TempLineFeeNoteOnReportHist.Copy(LineFeeNoteOnReportHist);
            TempLineFeeNoteOnReportHist.Insert;
        until TempLineFeeNoteOnReportHist.Next = 0;
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterGetRecordSalesInvoiceHeader(SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetDocumentCaption(SalesInvoiceHeader: Record "Sales Invoice Header"; var DocCaption: Text)
    begin
    end;

    [IntegrationEvent(false, false)]
    [Scope('OnPrem')]
    procedure OnGetReferenceText(SalesInvoiceHeader: Record "Sales Invoice Header"; var ReferenceText: Text[80]; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterPostDataItem(var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
    end;

    [Scope('OnPrem')]
    procedure "--- Text Module ---"()
    begin
    end;

    [Scope('OnPrem')]
    procedure TestLicPermissionTM(): Boolean
    begin
        // >> #TMW17.00:A001
        // if (LicPermission."Object Type" <> LicPermission."Object Type"::Codeunit) or
        //    (LicPermission."Object Number" <> CODEUNIT::"Text Module Engine")  // #TMW17.10.01:T100
        // then begin
        //     LicPermission.Get(LicPermission."Object Type"::Codeunit, CODEUNIT::"Text Module Engine");  // #TMW17.10.01:T100
        // end;

        if LicPermission."Execute Permission" = LicPermission."Execute Permission"::Yes then begin
            exit(true);
        end else begin
            exit(false);
        end;
        // << #TMW17.00:A001
    end;
}

