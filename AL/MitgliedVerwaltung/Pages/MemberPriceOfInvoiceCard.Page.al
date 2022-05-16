page 50233 "Member Price of Invoice Card"
{
    Caption = 'Rechnungsbeitrag Karte';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Member Price Of Invoice";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Allgemein';
                field("Contribution year"; Rec.YearCode)
                {
                    ToolTip = 'Specifies the value of the YearCode field.';
                    ApplicationArea = All;

                    trigger OnAfterLookup(Selected: RecordRef)
                    var
                        ContributionYears: Record "History year";
                    begin
                        ContributionYears.SetFilter(Year, Rec.YearCode);
                        ContributionYears.SetFilter(MemberType, Rec."Contribution Type");
                        ContributionYears.SetFilter(MemberNo, Rec.MemberNo);
                        if not ContributionYears.FindFirst() then begin
                            ContributionYears.Init();
                            ContributionYears.Year := Rec.YearCode;
                            ContributionYears.MemberType := Rec."Contribution Type";
                            ContributionYears."WOB IST" := Rec."Contribution IST";
                            ContributionYears."WOB Soll" := Rec."Contribution SOLL";
                            ContributionYears."WOB Date" := Rec."Date of Invoice";
                            ContributionYears.MemberType := Rec."Contribution Type";
                            ContributionYears."WOB Difference" := Rec.WOBDifferenceAmount;
                            ContributionYears."WOB Comment" := Rec.Comment;
                            ContributionYears.WOB := Rec.WOB;
                            ContributionYears."Vote Number" := Rec."Vote Number";
                            ContributionYears."Contribution Money" := Rec."Contribution Money";
                            ContributionYears.contactNo := Rec."ContactNo.";
                            ContributionYears.ContactInfo := Rec.ContactInfo;
                            ContributionYears.InvoiceSend := Rec.InvoiceSend;
                            ContributionYears.OrderNo_WOB := Rec."WOB OrderNr";
                            ContributionYears.MemberNo := Rec.MemberNo;
                            ContributionYears.MemberDate := Rec.MemberDate;
                            ContributionYears.AmountCalc := ("Contribution IST" / 12) * (DATE2DMY(MemberDate, 2));




                            ContributionYears."WZP IST" := Rec.WZPISAmount;
                            ContributionYears."WZP Soll" := Rec.WZPSOLLAmount;
                            ContributionYears."WZP Difference" := Rec.WZPDifferenceAmount;
                            ContributionYears."WZP Date" := Rec.InvoiceDateWZP;
                            ContributionYears."WZP Comment" := Rec."WZP Comment";
                            ContributionYears.ContactNoWZP := Rec."ContactNo. WZP";
                            ContributionYears."ContactInfo WZP" := Rec."ContactInfo WZP";
                            ContributionYears."InvoiceSend WZP" := Rec."InvoiceSend WZP";
                            ContributionYears.OrderNo_WZP := Rec."WZP OrderNr";
                            // ContributionYears.AmountCalcWZP := Rec.AmountCalcWZP;
                            ContributionYears.AmountCalcWZP := (WZPISAmount / 12) * (DATE2DMY(MemberDate, 2));



                            ContributionYears."FuE Soll" := Rec.FuESollAmount;
                            ContributionYears."FuE IST" := Rec.FuEISAmount;
                            ContributionYears."FuE Difference" := Rec.FuEDifferenceAmount;
                            ContributionYears."FuE Date" := Rec.FuEInvoiceDate;
                            ContributionYears."FuE Comment" := Rec."FuE Comment";
                            ContributionYears.ContactNoFUE := Rec."ContactNo. FUE";
                            ContributionYears."ContactInfo FUE" := Rec."ContactInfo FUE";
                            ContributionYears."InvoiceSend FUE" := Rec."InvoiceSend FUE";
                            ContributionYears.OrderNo_FUE := Rec."FUE OrderNr";
                            // ContributionYears.AmountCalcFUE := Rec.AmountCalcFUE;
                            ContributionYears.AmountCalcFUE := (FuEISAmount / 12) * (DATE2DMY(MemberDate, 2));





                            ContributionYears.Insert(true);
                        end else begin
                            // If "Contribution SOLL" <> 0 then begin

                            ContributionYears.Year := Rec.YearCode;
                            ContributionYears.MemberType := Rec."Contribution Type";
                            ContributionYears."WOB IST" := Rec."Contribution IST";
                            ContributionYears."WOB Soll" := Rec."Contribution SOLL";
                            ContributionYears."WOB Date" := Rec."Date of Invoice";
                            ContributionYears.MemberType := Rec."Contribution Type";
                            ContributionYears."Contribution Money" := Rec."Contribution Money";
                            ContributionYears."WOB Difference" := Rec.WOBDifferenceAmount;
                            ContributionYears."Vote Number" := Rec."Vote Number";
                            ContributionYears."WOB Comment" := Rec.Comment;
                            ContributionYears.WOB := Rec.WOB;
                            ContributionYears.contactNo := Rec."ContactNo.";
                            ContributionYears.ContactInfo := Rec.ContactInfo;
                            ContributionYears.InvoiceSend := Rec.InvoiceSend;
                            ContributionYears.OrderNo_WOB := Rec."WOB OrderNr";
                            ContributionYears.MemberNo := Rec.MemberNo;
                            ContributionYears.MemberDate := Rec.MemberDate;
                            // ContributionYears.AmountCalc := Rec.AmountCalc;
                            ContributionYears.AmountCalc := ("Contribution IST" / 12) * (DATE2DMY(MemberDate, 2));



                            ContributionYears."WZP IST" := Rec.WZPISAmount;
                            ContributionYears."WZP Soll" := Rec.WZPSOLLAmount;
                            ContributionYears."WZP Difference" := Rec.WZPDifferenceAmount;
                            ContributionYears."WZP Date" := Rec.InvoiceDateWZP;
                            ContributionYears."WZP Comment" := Rec."WZP Comment";
                            ContributionYears.ContactNoWZP := Rec."ContactNo. WZP";
                            ContributionYears."ContactInfo WZP" := Rec."ContactInfo WZP";
                            ContributionYears."InvoiceSend WZP" := Rec."InvoiceSend WZP";
                            ContributionYears.OrderNo_WZP := Rec."WZP OrderNr";
                            // ContributionYears.AmountCalcWZP := Rec.AmountCalcWZP;
                            ContributionYears.AmountCalcWZP := (WZPISAmount / 12) * (DATE2DMY(MemberDate, 2));



                            ContributionYears."FuE Soll" := Rec.FuESollAmount;
                            ContributionYears."FuE IST" := Rec.FuEISAmount;
                            ContributionYears."FuE Difference" := Rec.FuEDifferenceAmount;
                            ContributionYears."FuE Date" := Rec.FuEInvoiceDate;
                            ContributionYears."FuE Comment" := Rec."FuE Comment";
                            ContributionYears.ContactNoFUE := Rec."ContactNo. FUE";
                            ContributionYears."ContactInfo FUE" := Rec."ContactInfo FUE";
                            ContributionYears."InvoiceSend FUE" := Rec."InvoiceSend FUE";
                            ContributionYears.OrderNo_FUE := Rec."FUE OrderNr";
                            // ContributionYears.AmountCalcFUE := Rec.AmountCalcFUE;
                            ContributionYears.AmountCalcFUE := (FuEISAmount / 12) * (DATE2DMY(MemberDate, 2));

                            ContributionYears.Modify(true);
                        end;
                    end;
                    // end;

                    trigger OnValidate()
                    var
                        ContributionYears: Record "History year";
                        LineNo: Integer;
                    begin
                        LineNo := 10;
                        ContributionYears.SetFilter(Year, YearCode);
                        ContributionYears.SetFilter(MemberType, "Contribution Type");
                        ContributionYears.SetFilter(MemberNo, Rec.MemberNo);
                        if ContributionYears.FindFirst() then begin

                            Rec."Contribution IST" := ContributionYears."WOB IST";
                            Rec."Contribution SOLL" := ContributionYears."WOB Soll";
                            Rec."Date of Invoice" := ContributionYears."WOB Date";
                            Rec.WOBDifferenceAmount := ContributionYears."WOB Difference";
                            Rec."Vote Number" := ContributionYears."Vote Number";
                            Rec.Comment := ContributionYears."WOB Comment";
                            Rec.WOB := ContributionYears.WOB;
                            Rec."Contribution Money" := ContributionYears."Contribution Money";
                            Rec."ContactNo." := ContributionYears.ContactNo;
                            Rec.ContactInfo := ContributionYears.ContactInfo;
                            Rec.InvoiceSend := ContributionYears.InvoiceSend;
                            Rec."WOB OrderNr" := ContributionYears.OrderNo_WOB;
                            Rec.MemberNo := ContributionYears.MemberNo;
                            Rec.AmountCalc := ContributionYears.AmountCalc;


                            Rec.WZPISAmount := ContributionYears."WZP IST";
                            Rec.WZPSOLLAmount := ContributionYears."WZP Soll";
                            Rec.WZPDifferenceAmount := ContributionYears."WZP Difference";
                            Rec.InvoiceDateWZP := ContributionYears."WZP Date";
                            Rec."WZP Comment" := ContributionYears."WZP Comment";
                            Rec."ContactNo. WZP" := ContributionYears.ContactNoWZP;
                            Rec."ContactInfo WZP" := ContributionYears."ContactInfo WZP";
                            Rec."InvoiceSend WZP" := ContributionYears."InvoiceSend WZP";
                            Rec."WZP OrderNr" := ContributionYears.OrderNo_WZP;
                            Rec.AmountCalcWZP := ContributionYears.AmountCalcWZP;




                            Rec.FuESollAmount := ContributionYears."FuE Soll";
                            Rec.FuEISAmount := ContributionYears."FuE IST";
                            Rec.FuEInvoiceDate := ContributionYears."FuE Date";
                            Rec."FuE Comment" := ContributionYears."FuE Comment";
                            Rec.FuEDifferenceAmount := ContributionYears."FuE Difference";
                            Rec."ContactNo. FUE" := ContributionYears.ContactNoFUE;
                            Rec."ContactInfo FUE" := ContributionYears."ContactInfo FUE";
                            Rec."InvoiceSend FUE" := ContributionYears."InvoiceSend FUE";
                            Rec."FUE OrderNr" := ContributionYears.OrderNo_FUE;
                            Rec.AmountCalcFUE := ContributionYears.AmountCalcFUE;

                        end else begin
                            Rec."Contribution IST" := 0;
                            Rec."Contribution SOLL" := 0;
                            Rec."Date of Invoice" := 0D;
                            Rec.WOBDifferenceAmount := 0;
                            Rec.Comment := '';
                            Rec.WOB := 0;
                            Rec."Contribution Money" := 0;
                            Rec."ContactNo." := '';
                            Rec."WOB OrderNr" := '';
                            Rec.ContactInfo := '';
                            Rec.AmountCalc := 0;


                            Rec.WZPISAmount := 0;
                            Rec.WZPSOLLAmount := 0;
                            Rec.WZPDifferenceAmount := 0;
                            Rec.InvoiceDateWZP := 0D;
                            Rec."WZP Comment" := '';
                            Rec."ContactNo. WZP" := '';
                            rec."WZP OrderNr" := '';
                            Rec."ContactInfo WZP" := '';
                            Rec.AmountCalcWZP := 0;



                            Rec.FuESollAmount := 0;
                            Rec.FuEISAmount := 0;
                            Rec.FuEInvoiceDate := 0D;
                            Rec."FuE Comment" := '';
                            Rec.FuEDifferenceAmount := 0;
                            Rec."ContactNo. FUE" := '';
                            Rec."FUE OrderNr" := '';
                            Rec."ContactInfo FUE" := '';
                            Rec.AmountCalcFUE := 0;

                        end;
                    end;
                }
                field("Contribution Money"; Rec."Contribution Money")
                {
                    ToolTip = 'Specifies the value of the Contribution Money field.';
                    ApplicationArea = All;
                }
                field("Contribution Type"; Rec."Contribution Type")
                {
                    ToolTip = 'Specifies the value of the Contribution Type field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(WOB; Rec.WOB)
                {
                    ToolTip = 'Specifies the value of the WOB field.';
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        ContRegul: Record "Contribution Regulation";
                        MemberType: Record "Member Type";
                    begin
                        case "Contribution Type" of
                            'ordentliche Mitglieder AGFW':
                                begin
                                    ContRegul.SetFilter(Year, Rec.YearCode);
                                    ContRegul.SetFilter("Until TJ/MA", '>=%1', Rec.WOB);
                                    ContRegul.SetFilter("Member Type", "Contribution Type");
                                    if ContRegul.FindFirst() then begin
                                        Rec."Contribution IST" := ContRegul."Price WOB";
                                        Rec."Contribution SOLL" := ContRegul."Price WOB";
                                        Rec."Vote Number" := ContRegul."Vote Number";
                                        Rec.AmountCalc := ("Contribution IST" / 12) * (DATE2DMY(MemberDate, 2));

                                        Rec.WOBDifferenceAmount := 0;

                                        Rec.WZPISAmount := ContRegul."Price WZP";
                                        Rec.WZPSOLLAmount := ContRegul."Price WZP";
                                        Rec.AmountCalcWZP := (WZPISAmount / 12) * (DATE2DMY(MemberDate, 2));
                                        Rec.WZPDifferenceAmount := 0;
                                        // Rec."Vote Number" := 1;//Stimmenanzahl

                                        Rec.FuESollAmount := ContRegul."Price FUE";
                                        Rec.FuEISAmount := ContRegul."Price FUE";
                                        Rec.AmountCalcFUE := (FuEISAmount / 12) * (DATE2DMY(MemberDate, 2));
                                        Rec.FuEDifferenceAmount := 0;
                                    end else begin
                                        Rec."Contribution IST" := 0;
                                        Rec."Contribution SOLL" := 0;
                                        Rec."Date of Invoice" := 0D;
                                        Rec.WOB := 0;
                                        Rec.Comment := '';
                                        Rec.WOBDifferenceAmount := 0;

                                        Rec.WZPISAmount := 0;
                                        Rec.WZPSOLLAmount := 0;
                                        Rec.WZPDifferenceAmount := 0;
                                        Rec.InvoiceDateWZP := 0D;
                                        Rec."WZP Comment" := '';

                                        Rec.FuESollAmount := 0;
                                        Rec.FuEISAmount := 0;
                                        Rec.FuEDifferenceAmount := 0;
                                        Rec.FuEInvoiceDate := 0D;
                                        Rec."FuE Comment" := '';
                                    end;
                                end;
                            'fördernde Mitglieder AGFW':
                                begin
                                    ContRegul.SetFilter(Year, Rec.YearCode);
                                    ContRegul.SetFilter("Until TJ/MA", '>=%1', Rec.WOB);
                                    ContRegul.SetFilter("Member Type", "Contribution Type");
                                    if ContRegul.FindFirst() then begin
                                        Rec."Contribution IST" := ContRegul."Price WOB";
                                        Rec."Contribution SOLL" := ContRegul."Price WOB";
                                        Rec."Vote Number" := ContRegul."Vote Number";
                                        Rec.WOBDifferenceAmount := 0;
                                    end else begin
                                        Rec."Contribution IST" := 0;
                                        Rec."Contribution SOLL" := 0;
                                        Rec."Date of Invoice" := 0D;
                                        Rec.WOB := 0;
                                        Rec.Comment := '';
                                        Rec.WOBDifferenceAmount := 0;
                                        Rec."Vote Number" := 0;
                                    end;
                                end;
                            'SONDERMITGLIEDER':
                                begin
                                    ContRegul.SetFilter(Year, Rec.YearCode);
                                    ContRegul.SetFilter("Until TJ/MA", '>=%1', Rec.WOB);
                                    ContRegul.SetFilter("Member Type", "Contribution Type");
                                    if ContRegul.FindFirst() then begin
                                        Rec."Contribution IST" := ContRegul."Price WOB";
                                        Rec."Contribution SOLL" := ContRegul."Price WOB";
                                        Rec.WOBDifferenceAmount := 0;
                                    end else begin
                                        Rec."Contribution IST" := 0;
                                        Rec."Contribution SOLL" := 0;
                                        Rec."Date of Invoice" := 0D;
                                        Rec.WOB := 0;
                                        Rec.Comment := '';
                                        Rec.WOBDifferenceAmount := 0;
                                        // Rec."Vote Number" := 1;
                                    end;
                                end;
                            'EHRENMITGLIEDER':
                                begin
                                    ContRegul.SetFilter(Year, Rec.YearCode);
                                    ContRegul.SetFilter("Until TJ/MA", '>=%1', Rec.WOB);
                                    ContRegul.SetFilter("Member Type", "Contribution Type");
                                    if ContRegul.FindFirst() then begin
                                        Rec."Contribution IST" := ContRegul."Price WOB";
                                        Rec."Contribution SOLL" := ContRegul."Price WOB";
                                        Rec.WOBDifferenceAmount := 0;
                                    end else begin
                                        Rec."Contribution IST" := 0;
                                        Rec."Contribution SOLL" := 0;
                                        Rec."Date of Invoice" := 0D;
                                        Rec.WOB := 0;
                                        Rec.Comment := '';
                                        Rec.WOBDifferenceAmount := 0;
                                        // Rec."Vote Number" := 1;
                                    end;
                                end;
                            else begin

                                    Rec."Contribution IST" := ContRegul."Price WOB";
                                    Rec."Contribution SOLL" := ContRegul."Price WOB";
                                end;
                        end;

                        if WOB > 18000 then begin

                            Rec."Contribution IST" := Abs(124.918);
                            Rec."Contribution SOLL" := Abs(124.918);
                            Rec.WZPISAmount := Abs(5.950);
                            Rec.WZPSOLLAmount := Abs(5.950);
                            Rec.FuEISAmount := Abs(9.500);
                            Rec.FuESollAmount := Abs(9.500);
                        end
                    end;

                }
                field("Contribution SOLL"; Rec."Contribution SOLL")
                {
                    ToolTip = 'Specifies the value of the Contribution SOLL field.';
                    ApplicationArea = All;
                }
                field("Contribution IST"; Rec."Contribution IST")
                {
                    ToolTip = 'Specifies the value of the Contribution IST field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var

                    begin
                        Rec.WOBDifferenceAmount := Rec."Contribution SOLL" - Rec."Contribution IST";
                        Rec.AmountCalc := ("Contribution IST" / 12) * (DATE2DMY(MemberDate, 2));
                    end;
                }
                field(WOBDifferenceAmount; Rec.WOBDifferenceAmount)
                {
                    ToolTip = 'Specifies the value of the DiferenceAmount field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("WOB OrderNr"; Rec."WOB OrderNr")
                {
                    ToolTip = 'Specifies the value of the Bestellnummer WOB field.';
                    ApplicationArea = All;
                }

                field("Date of Invoice"; Rec."Date of Invoice")
                {
                    ToolTip = 'Specifies the value of the Date of Invoice field.';
                    ApplicationArea = All;

                }
                field(WOBComment; Rec.Comment)
                {
                    ToolTip = 'Specifies the value of the Reduzierungsgrund field.';
                    ApplicationArea = All;
                }
                field("Vote Number"; Rec."Vote Number")
                {
                    ToolTip = 'Specifies the value of the Stimmen Anzahl field.';
                    ApplicationArea = All;
                }
                field("ContactNo."; Rec."ContactNo.")
                {
                    ToolTip = 'Specifies the value of the ContactNo. field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec."ContactNo." <> xRec."ContactNo." then
                            Rec.ContactInfo := ''
                        else
                            ;

                    end;

                }
                field(InvoiceSend; Rec.InvoiceSend)
                {
                    ToolTip = 'Specifies the value of the Rechnung verschickt field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Contact: Record Contact;
                        Customer: Record Customer;
                    begin
                        Contact.SetFilter("No.", "ContactNo.");
                        if Contact.FindFirst() then begin
                            if Contact."Contact Business Relation" = Contact."Contact Business Relation"::Customer then begin
                                if InvoiceSend = InvoiceSend::"By Mail" then
                                    ContactInfo := Contact."E-Mail"
                                else
                                    ContactInfo := Contact.Address + ',' + Contact."Post Code" + ',' + Contact.City;

                            end else
                                Message(Text001);
                        end else
                            ;
                    end;
                }
                field(ContactInfo; Rec.ContactInfo)
                {
                    ToolTip = 'Specifies the value of the ContactAdress field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(MemberNo; Rec.MemberNo)
                {
                    ToolTip = 'Specifies the value of the Mitglied Nr. field.';
                    ApplicationArea = All;
                }
                field(AmountCalc; Rec.AmountCalc)
                {
                    ToolTip = 'Specifies the value of the Anteilig für das jahr field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
            group("WZP Umlage")
            {
                Caption = 'WZP Umlage';
                Editable = MemberTypevisible;
                field(WZPSOLLAmount; Rec.WZPSOLLAmount)
                {
                    ToolTip = 'Specifies the value of the Beitrag WZP SOLL field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(WZPISAmount; Rec.WZPISAmount)
                {
                    ToolTip = 'Specifies the value of the Beitrag WZP IS field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.WZPDifferenceAmount := Rec.WZPSOLLAmount - Rec.WZPISAmount;
                        AmountCalcWZP := (WZPISAmount / 12) * (DATE2DMY(MemberDate, 2));


                    end;
                }
                field(WZPDifferenceAmount; Rec.WZPDifferenceAmount)
                {
                    ToolTip = 'Specifies the value of the WZP Differenzbetrag  field.';
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        // Rec.WZPDifferenceAmount := Rec.WZPSOLLAmount - Rec.WZPISAmount;
                    end;


                }
                field("WZP OrderNr"; Rec."WZP OrderNr")
                {
                    ToolTip = 'Specifies the value of the Bestellnummer WZP field.';
                    ApplicationArea = All;
                }
                field(InvoiceDateWZP; Rec.InvoiceDateWZP)
                {
                    ToolTip = 'Specifies the value of the Rechnungsdatum WZP  field.';
                    ApplicationArea = All;
                }
                field("WZP Comment"; Rec."WZP Comment")
                {
                    ToolTip = 'Specifies the value of the Reduzierungsgrund WZP field.';
                    ApplicationArea = All;
                }
                field("ContactNo. WZP"; Rec."ContactNo. WZP")
                {
                    ToolTip = 'Specifies the value of the Kontakt Nr. field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec."ContactNo. WZP" <> xRec."ContactNo. WZP" then
                            Rec."ContactInfo WZP" := ''
                        else
                            ;

                    end;

                }
                field("InvoiceSend WZP"; Rec."InvoiceSend WZP")
                {
                    ToolTip = 'Specifies the value of the Rechnung verschickt field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Contact: Record Contact;
                        Customer: Record Customer;
                    begin
                        Contact.SetFilter("No.", "ContactNo. WZP");
                        if Contact.FindFirst() then begin
                            if Contact."Contact Business Relation" = Contact."Contact Business Relation"::Customer then begin

                                if "InvoiceSend WZP" = "InvoiceSend WZP"::"By Mail" then
                                    "ContactInfo WZP" := Contact."E-Mail"
                                else
                                    "ContactInfo WZP" := Contact.Address + ',' + Contact."Post Code" + ',' + Contact.City;

                            end else
                                Message(Text001);
                        end else
                            ;


                    end;
                }
                field("ContactInfo WZP"; Rec."ContactInfo WZP")
                {
                    ToolTip = 'Specifies the value of the Kontakt Adresse/E-Mail field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AmountCalcWZP; Rec.AmountCalcWZP)
                {
                    ToolTip = 'Specifies the value of the Anteilig für das jahr WZP field.';
                    ApplicationArea = All;
                    Editable = false;
                }



            }
            group("Fu.E Umlage")
            {
                Caption = 'Fu.E Umlage';
                Editable = MemberTypevisible;


                field(FuESollAmount; Rec.FuESollAmount)
                {
                    ToolTip = 'Specifies the value of the Fu.E Umlage Soll field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(FuEISAmount; Rec.FuEISAmount)
                {
                    ToolTip = 'Specifies the value of the Fu.E Umlage IST field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.FuEDifferenceAmount := Rec.FuESollAmount - Rec.FuEISAmount;
                        AmountCalcFUE := (FuEISAmount / 12) * (DATE2DMY(MemberDate, 2));
                    end;
                }
                field(FuEDifferenceAmount; Rec.FuEDifferenceAmount)
                {
                    ToolTip = 'Specifies the value of the Fu.E Differenzbetrag field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("FUE OrderNr"; Rec."FUE OrderNr")
                {
                    ToolTip = 'Specifies the value of the Bestellnummer F&E field.';
                    ApplicationArea = All;
                }
                field(FuEInvoiceDate; Rec.FuEInvoiceDate)
                {
                    ToolTip = 'Specifies the value of the Rechnungsdatum Fu.E field.';
                    ApplicationArea = All;
                }
                field("FuE Comment"; Rec."FuE Comment")
                {
                    ToolTip = 'Specifies the value of the Reduzierungsgrund F&E field.';
                    ApplicationArea = All;
                }
                field("ContactNo. FUE"; Rec."ContactNo. FUE")
                {
                    ToolTip = 'Specifies the value of the Kontakt Nr. field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if Rec."ContactNo. FUE" <> xRec."ContactNo. FUE" then
                            Rec."ContactInfo FUE" := ''
                        else
                            ;

                    end;

                }
                field("InvoiceSend FUE"; Rec."InvoiceSend FUE")
                {
                    ToolTip = 'Specifies the value of the Rechnung verschickt field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Contact: Record Contact;
                        Customer: Record Customer;
                    begin
                        Contact.SetFilter("No.", "ContactNo. FUE");
                        if Contact.FindFirst() then begin
                            if Contact."Contact Business Relation" = Contact."Contact Business Relation"::Customer then begin
                                if "InvoiceSend FUE" = "InvoiceSend FUE"::"By Mail" then
                                    "ContactInfo FUE" := Contact."E-Mail"
                                else
                                    "ContactInfo FUE" := Contact.Address + ',' + Contact."Post Code" + ',' + Contact.City;

                            end else
                                Message(Text001);
                        end else
                            ;


                    end;
                }
                field("ContactInfo FUE"; Rec."ContactInfo FUE")
                {
                    ToolTip = 'Specifies the value of the Kontakt Adresse/E-Mail field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AmountCalcFUE; Rec.AmountCalcFUE)
                {
                    ToolTip = 'Specifies the value of the Anteilig für das jahr Fu.E field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Regulation List")
            {
                Caption = 'Beitragsordnung';
                ApplicationArea = All;
                RunObject = page "Contribution Regulation List";


            }
            action("Amount of years")
            {
                Caption = 'Beitragsjahr Geschichte';
                ApplicationArea = all;
                RunObject = page "History Year List";
            }
            action(Invoice)
            {
                ApplicationArea = All;
                Caption = 'Abrechnung';

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    SalesLine: Record "Sales Line";
                    Item: Record Item;
                    LineNo: Integer;
                    OptionInvoicePage: page "Option Invoice List";
                    OptionInvoiceRec: Record "Option Invoice Temp";
                    HeaderNumber: Integer;
                    Contact: Record Contact;
                    Customer: record Customer;
                    ItemUnitOfMeasure: Record "Item Unit of Measure";
                    CountChecked: Integer;

                begin

                    SalesHeader.SetFilter(InvoiceName, (YearCode + CopyStr("Contribution Type", 1, 3)));
                    SalesHeader.SetFilter(MemberNo, Rec.MemberNo);
                    if SalesHeader.FindFirst() then
                        Message('Ein Beleg ist mit dieses Jahr und Mitgliednummer schon vorhanden. Darf nicht nochmal erstellt werden.')
                    else
                        OptionInvoicePage.LookupMode(true);
                    If OptionInvoicePage.RunModal() = Action::LookupOK then begin
                        OptionInvoiceRec.SetRange(Checked, true);
                        if OptionInvoiceRec.FindFirst() then
                            if "Contribution Money" <> 0 then begin
                                repeat
                                    Contact.Get("ContactNo.");


                                    HeaderNumber += Rec."No." + 1000;
                                    SalesHeader.SetHideValidationDialog(TRUE);
                                    SalesLine.SetHideValidationDialog(TRUE);
                                    SalesHeader.Init();
                                    SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
                                    SalesHeader."No." := Format(HeaderNumber);//Check
                                    SalesHeader.Validate("Sell-to Customer Name", Contact.Name);
                                    // SalesHeader."Applies-to Doc. No." := YearCode + CopyStr("Contribution Type", 1, 3);
                                    SalesHeader.InvoiceName := YearCode + CopyStr("Contribution Type", 1, 3);
                                    SalesHeader.InvoiceYear := YearCode;
                                    SalesHeader.MemberNo := MemberNo;
                                    SalesHeader."Posting Description" := '';
                                    SalesHeader."External Document No." := '';
                                    SalesHeader.Validate("Posting Date", "Date of Invoice");

                                    SalesHeader.Insert(true);
                                    SalesHeader.Modify(true);


                                    Item.SetFilter(Description, OptionInvoiceRec.Code);
                                    if item.FindSet() then
                                        LineNo += 10000;
                                    SalesLine.Init();
                                    SalesLine.Validate("Document Type", SalesHeader."Document Type");
                                    SalesLine.Validate("Document No.", SalesHeader."No.");
                                    SalesLine.Validate("Line No.", LineNo);
                                    SalesLine.Validate(Type, SalesLine.Type::Item);
                                    // SalesLine."No." := item."No.";
                                    SalesLine.Validate("No.", Item."No.");
                                    SalesLine.Validate(Quantity, 1);
                                    case OptionInvoiceRec.Code of
                                        'Beitrittsgeld':
                                            begin
                                                SalesLine.Validate("Unit Price", "Contribution Money");
                                                SalesLine.Validate("Line Amount", "Contribution Money");
                                            end;
                                        'Beitragsrechnung Geschäftsjahr':
                                            begin
                                                SalesLine.Validate("Unit Price", "Contribution IST");
                                                SalesLine.Validate("Line Amount", "Contribution IST");
                                            end;
                                        'Beitragsrechnung Wärmezählerprogramm':
                                            begin
                                                SalesLine.Validate("Unit Price", WZPISAmount);
                                                SalesLine.Validate("Line Amount", WZPISAmount);
                                            end;
                                        'Beitragsrechnung Gemeinschaftsforschungsprojekt':
                                            begin
                                                SalesLine.Validate("Unit Price", FuEISAmount);
                                                SalesLine.Validate("Line Amount", FuEISAmount);
                                            end;
                                    end;
                                    SalesLine.Validate(Description, Item.Description);
                                    SalesLine.Insert(true);

                                until OptionInvoiceRec.Next() = 0;

                            end else
                                Message('Beitragsgeld ist leer.');

                        if SalesHeader.Get(SalesHeader."Document Type"::Invoice, HeaderNumber) then
                            Page.Run(Page::"Sales Invoice", SalesHeader);

                    end else
                        ;
                end;


            }
        }
    }

    var
        MemberTypevisible: Boolean;
        MemberTypeVAR: Record "Member Type";
        Text001: Label 'Der Kontakt muss als Debitor erstellt werden';
        Text002: Label 'Beitrittsgeld';
        Text003: Label 'Beitragsrechnung Geschäftsjahr';
        Text004: Label 'Beitragsrechnung Wärmezählerprogramm';
        Text005: Label 'Beitragsrechnung Gemeinschaftsforschungsprojekt';
        Text007: text[250];
        Text008: Label 'Welche Rechnung möchten Sie erstellen?';
        Text009: Label 'Sie haben Option %1 augewählt.';
        Text010: text[250];

        InvoiceOptions: text[250];
        Selected: Integer;


    trigger OnOpenPage()
    var
        Members: Record Members;
    begin

        // Rec.Init();
        // Rec.WOB := 0;
        // Rec.YearCode := '';
        // Rec.WOBDifferenceAmount := 0;
        // Rec."Contribution IST" := 0;
        // Rec."Contribution Money" := 0;


        if (Rec."Contribution Type" = 'SONDERMITGLIEDER') OR (Rec."Contribution Type" = 'EHRENMITGLIEDER') then begin
            Rec."Vote Number" := 1;
            MemberTypevisible := false
        end else
            MemberTypevisible := true;
        // Rec.Insert(true);
        // Rec.Modify(true);
    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        // IF "Contribution Money" <> 0 then 



        AmountCalc := ("Contribution IST" / 12) * (DATE2DMY(MemberDate, 2));
        AmountCalcWZP := (WZPISAmount / 12) * (DATE2DMY(MemberDate, 2));
        AmountCalcFUE := (FuEISAmount / 12) * (DATE2DMY(MemberDate, 2));


    end;

}