page 50301 "Option Invoice List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Option Invoice Temp";
    Editable = true;


    layout
    {
        area(Content)
        {
            repeater("Welche Beitragsrechnung möchten Sie erstellen?")
            {
                field(Code; Code)
                {
                    TableRelation = item.Description;

                }
                field(Checked; Checked)
                {

                }



                // field(Beitrittsgeld; Beitrittsgeld)
                // {
                //     ;
                // }
                // field("Geschäftsjahr"; "Geschäftsjahr")
                // {

                // }
                // field("Wärmezählerprogramm"; "Wärmezählerprogramm")
                // {

                // }
                // field("Gemeinschaftsforschungsprojekt"; Gemeinschaftsforschungsprojekt)
                // {

                // }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SelectAll)
            {
                ApplicationArea = All;
                Image = AllLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Alle auswählen';

                trigger OnAction()
                begin
                    Rec.ModifyAll(Checked, true);
                    CurrPage.Update(false);


                end;
            }
            action(UnSelectAll)
            {
                ApplicationArea = All;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Caption = 'Keine auswählen';

                trigger OnAction()
                begin
                    Rec.ModifyAll(Checked, false);
                    CurrPage.Update(false);


                end;
            }
        }
    }

    var
        myInt: Integer;

    local procedure CreateInvoice(Create: Boolean; Titel: Code[250])
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        LineNo: Integer;
    begin
        if Create = true then begin
            Message('Wird ein %1 erstellt?', Titel);
            SalesHeader.SetHideValidationDialog(TRUE);
            SalesLine.SetHideValidationDialog(TRUE);

            SalesHeader.Init();
            SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
            // SalesHeader."No." := Format();//Check
            SalesHeader."Sell-to Customer No." := '';
            SalesHeader."Posting Description" := '';
            SalesHeader."External Document No." := '';
            SalesHeader.Insert(true);
            SalesHeader.Modify(true);

            // Item.SetFilter(Description, SelectStr(Selected, Text010));
            if item.FindSet() then
                repeat
                    LineNo += 10000;
                    SalesLine.Init();
                    SalesLine."Document Type" := SalesHeader."Document Type";
                    SalesLine."Document No." := SalesHeader."No.";
                    SalesLine."Line No." := LineNo;
                    SalesLine.Type := SalesLine.Type::Item;
                    SalesLine."No." := item."No.";
                    SalesLine.Description := item.Description;
                    SalesLine.Validate("Unit of Measure", item."Base Unit of Measure");
                    SalesLine.Insert(true);

                until Item.Next() = 0;

        end else
            ;
    end;
}