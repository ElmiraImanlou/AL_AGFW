pageextension 50301 "Sales Invoice Line Ext" extends "Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Qty. to Ship"; Rec."Qty. to Ship")
            {
                ToolTip = 'Specifies the quantity of items that remain to be shipped.';
                ApplicationArea = All;
            }

            //     field("Allow Line Disc."; Rec."Allow Line Disc.")
            //     {
            //         ToolTip = 'Specifies the value of the Allow Line Disc. field.';
            //         ApplicationArea = All;
            //     }
            //     field(Amount; Rec.Amount)
            //     {
            //         ToolTip = 'Specifies the sum of amounts in the Line Amount field on the sales order lines.';
            //         ApplicationArea = All;
            //     }
            //     field("Amount Including VAT"; Rec."Amount Including VAT")
            //     {
            //         ToolTip = 'Specifies the value of the Amount Including VAT field.';
            //         ApplicationArea = All;
            //     }
            //     field("Area"; Rec."Area")
            //     {
            //         ToolTip = 'Specifies the value of the Area field.';
            //         ApplicationArea = All;
            //     }
            //     field("ATO Whse. Outstanding Qty."; Rec."ATO Whse. Outstanding Qty.")
            //     {
            //         ToolTip = 'Specifies how many assemble-to-order units on the sales order line need to be assembled and handled in warehouse documents.';
            //         ApplicationArea = All;
            //     }
            //     field("ATO Whse. Outstd. Qty. (Base)"; Rec."ATO Whse. Outstd. Qty. (Base)")
            //     {
            //         ToolTip = 'Specifies how many assemble-to-order units on the sales order line remain to be assembled and handled in warehouse documents.';
            //         ApplicationArea = All;
            //     }
            //     field("Attached Doc Count"; Rec."Attached Doc Count")
            //     {
            //         ToolTip = 'Specifies the number of attachments.';
            //         ApplicationArea = All;
            //     }
            //     field("Attached to Line No."; Rec."Attached to Line No.")
            //     {
            //         ToolTip = 'Specifies the value of the Attached to Line No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            //     {
            //         ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("BOM Item No."; Rec."BOM Item No.")
            //     {
            //         ToolTip = 'Specifies the value of the BOM Item No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Completely Shipped"; Rec."Completely Shipped")
            //     {
            //         ToolTip = 'Specifies the value of the Completely Shipped field.';
            //         ApplicationArea = All;
            //     }
            //     field("Copied From Posted Doc."; Rec."Copied From Posted Doc.")
            //     {
            //         ToolTip = 'Specifies the value of the Copied From Posted Doc. field.';
            //         ApplicationArea = All;
            //     }
            //     // field("Cross-Reference Type"; Rec."Cross-Reference Type")
            //     // {
            //     //     ToolTip = 'Specifies the value of the Cross-Reference Type field.';
            //     //     ApplicationArea = All;
            //     // }
            //     // field("Cross-Reference Type No."; Rec."Cross-Reference Type No.")
            //     // {
            //     //     ToolTip = 'Specifies the value of the Cross-Reference Type No. field.';
            //     //     ApplicationArea = All;
            //     // }
            //     field("Currency Code"; Rec."Currency Code")
            //     {
            //         ToolTip = 'Specifies the currency code for the amount on this line.';
            //         ApplicationArea = All;
            //     }
            //     field("Customer Disc. Group"; Rec."Customer Disc. Group")
            //     {
            //         ToolTip = 'Specifies the value of the Customer Disc. Group field.';
            //         ApplicationArea = All;
            //     }
            //     field("Customer Price Group"; Rec."Customer Price Group")
            //     {
            //         ToolTip = 'Specifies the value of the Customer Price Group field.';
            //         ApplicationArea = All;
            //     }
            //     field("Description 2"; Rec."Description 2")
            //     {
            //         ToolTip = 'Specifies the value of the Description 2 field.';
            //         ApplicationArea = All;
            //     }
            //     field("Dimension Set ID"; Rec."Dimension Set ID")
            //     {
            //         ToolTip = 'Specifies the value of the Dimension Set ID field.';
            //         ApplicationArea = All;
            //     }
            //     field("Document Type"; Rec."Document Type")
            //     {
            //         ToolTip = 'Specifies the type of document that you are about to create.';
            //         ApplicationArea = All;
            //     }
            //     field("Drop Shipment"; Rec."Drop Shipment")
            //     {
            //         ToolTip = 'Specifies if your vendor ships the items directly to your customer.';
            //         ApplicationArea = All;
            //     }
            //     field("Exit Point"; Rec."Exit Point")
            //     {
            //         ToolTip = 'Specifies the value of the Exit Point field.';
            //         ApplicationArea = All;
            //     }
            //     field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
            //     {
            //         ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
            //         ApplicationArea = All;
            //     }
            //     field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            //     {
            //         ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
            //         ApplicationArea = All;
            //     }
            //     field("Gross Weight"; Rec."Gross Weight")
            //     {
            //         ToolTip = 'Specifies the value of the Gross Weight field.';
            //         ApplicationArea = All;
            //     }
            //     field("IC Item Reference No."; Rec."IC Item Reference No.")
            //     {
            //         ToolTip = 'Specifies the IC item reference. If the line is being sent to one of your intercompany partners, this field is used together with the IC Partner Ref. Type field to indicate the item or account in your partner''s company that corresponds to the line.';
            //         ApplicationArea = All;
            //     }
            //     field("Inv. Disc. Amount to Invoice"; Rec."Inv. Disc. Amount to Invoice")
            //     {
            //         ToolTip = 'Specifies the actual invoice discount amount that will be posted for the line in next invoice.';
            //         ApplicationArea = All;
            //     }
            //     field("Item Category Code"; Rec."Item Category Code")
            //     {
            //         ToolTip = 'Specifies the value of the Item Category Code field.';
            //         ApplicationArea = All;
            //     }
            //     field("Item Reference Type"; Rec."Item Reference Type")
            //     {
            //         ToolTip = 'Specifies the value of the Item Reference Type field.';
            //         ApplicationArea = All;
            //     }
            //     field("Item Reference Type No."; Rec."Item Reference Type No.")
            //     {
            //         ToolTip = 'Specifies the value of the Item Reference Type No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Item Reference Unit of Measure"; Rec."Item Reference Unit of Measure")
            //     {
            //         ToolTip = 'Specifies the value of the Reference Unit of Measure field.';
            //         ApplicationArea = All;
            //     }
            //     field("Line Discount Calculation"; Rec."Line Discount Calculation")
            //     {
            //         ToolTip = 'Specifies the value of the Line Discount Calculation field.';
            //         ApplicationArea = All;
            //     }
            //     field("Net Weight"; Rec."Net Weight")
            //     {
            //         ToolTip = 'Specifies the value of the Net Weight field.';
            //         ApplicationArea = All;
            //     }
            //     field("Originally Ordered No."; Rec."Originally Ordered No.")
            //     {
            //         ToolTip = 'Specifies the value of the Originally Ordered No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Originally Ordered Var. Code"; Rec."Originally Ordered Var. Code")
            //     {
            //         ToolTip = 'Specifies the value of the Originally Ordered Var. Code field.';
            //         ApplicationArea = All;
            //     }
            //     field("Out-of-Stock Substitution"; Rec."Out-of-Stock Substitution")
            //     {
            //         ToolTip = 'Specifies the value of the Out-of-Stock Substitution field.';
            //         ApplicationArea = All;
            //     }
            //     field("Outbound Whse. Handling Time"; Rec."Outbound Whse. Handling Time")
            //     {
            //         ToolTip = 'Specifies a date formula for the time it takes to get items ready to ship from this location. The time element is used in the calculation of the delivery date as follows: Shipment Date + Outbound Warehouse Handling Time = Planned Shipment Date + Shipping Time = Planned Delivery Date.';
            //         ApplicationArea = All;
            //     }
            //     field("Outstanding Amount"; Rec."Outstanding Amount")
            //     {
            //         ToolTip = 'Specifies the value of the Outstanding Amount field.';
            //         ApplicationArea = All;
            //     }
            //     field("Outstanding Amount (LCY)"; Rec."Outstanding Amount (LCY)")
            //     {
            //         ToolTip = 'Specifies the value of the Outstanding Amount (LCY) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Outstanding Qty. (Base)"; Rec."Outstanding Qty. (Base)")
            //     {
            //         ToolTip = 'Specifies the outstanding quantity expressed in the base units of measure.';
            //         ApplicationArea = All;
            //     }
            //     field("Outstanding Quantity"; Rec."Outstanding Quantity")
            //     {
            //         ToolTip = 'Specifies how many units on the order line have not yet been shipped.';
            //         ApplicationArea = All;
            //     }
            //     field(Planned; Rec.Planned)
            //     {
            //         ToolTip = 'Specifies the value of the Planned field.';
            //         ApplicationArea = All;
            //     }
            //     field("Planned Delivery Date"; Rec."Planned Delivery Date")
            //     {
            //         ToolTip = 'Specifies the planned date that the shipment will be delivered at the customer''s address. If the customer requests a delivery date, the program calculates whether the items will be available for delivery on this date. If the items are available, the planned delivery date will be the same as the requested delivery date. If not, the program calculates the date that the items are available for delivery and enters this date in the Planned Delivery Date field.';
            //         ApplicationArea = All;
            //     }
            //     field("Planned Shipment Date"; Rec."Planned Shipment Date")
            //     {
            //         ToolTip = 'Specifies the date that the shipment should ship from the warehouse. If the customer requests a delivery date, the program calculates the planned shipment date by subtracting the shipping time from the requested delivery date. If the customer does not request a delivery date or the requested delivery date cannot be met, the program calculates the content of this field by adding the shipment time to the shipping date.';
            //         ApplicationArea = All;
            //     }
            //     field("Pmt. Discount Amount"; Rec."Pmt. Discount Amount")
            //     {
            //         ToolTip = 'Specifies the value of the Pmt. Discount Amount field.';
            //         ApplicationArea = All;
            //     }
            //     field("Posting Date"; Rec."Posting Date")
            //     {
            //         ToolTip = 'Specifies the value of the Posting Date field.';
            //         ApplicationArea = All;
            //     }
            //     field("Posting Group"; Rec."Posting Group")
            //     {
            //         ToolTip = 'Specifies the value of the Posting Group field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment %"; Rec."Prepayment %")
            //     {
            //         ToolTip = 'Specifies the prepayment percentage to use to calculate the prepayment for sales.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment Amount"; Rec."Prepayment Amount")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment Amount field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment Line"; Rec."Prepayment Line")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment Line field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment Tax Area Code"; Rec."Prepayment Tax Area Code")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment Tax Area Code field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment Tax Group Code"; Rec."Prepayment Tax Group Code")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment Tax Group Code field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment Tax Liable"; Rec."Prepayment Tax Liable")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment Tax Liable field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment VAT %"; Rec."Prepayment VAT %")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment VAT % field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment VAT Difference"; Rec."Prepayment VAT Difference")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment VAT Difference field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepayment VAT Identifier"; Rec."Prepayment VAT Identifier")
            //     {
            //         ToolTip = 'Specifies the value of the Prepayment VAT Identifier field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt Amt Deducted"; Rec."Prepmt Amt Deducted")
            //     {
            //         ToolTip = 'Specifies the prepayment amount that has already been deducted from ordinary invoices posted for this sales order line.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt Amt to Deduct"; Rec."Prepmt Amt to Deduct")
            //     {
            //         ToolTip = 'Specifies the prepayment amount that has already been deducted from ordinary invoices posted for this sales order line.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt VAT Diff. Deducted"; Rec."Prepmt VAT Diff. Deducted")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt VAT Diff. Deducted field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt VAT Diff. to Deduct"; Rec."Prepmt VAT Diff. to Deduct")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt VAT Diff. to Deduct field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. Amount Inv. (LCY)"; Rec."Prepmt. Amount Inv. (LCY)")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt. Amount Inv. (LCY) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. Amount Inv. Incl. VAT"; Rec."Prepmt. Amount Inv. Incl. VAT")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt. Amount Inv. Incl. VAT field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. Amt. Incl. VAT"; Rec."Prepmt. Amt. Incl. VAT")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt. Amt. Incl. VAT field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. Amt. Inv."; Rec."Prepmt. Amt. Inv.")
            //     {
            //         ToolTip = 'Specifies the prepayment amount that has already been invoiced to the customer for this sales line.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. Line Amount"; Rec."Prepmt. Line Amount")
            //     {
            //         ToolTip = 'Specifies the prepayment amount of the line in the currency of the sales document if a prepayment percentage is specified for the sales line.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. VAT Amount Inv. (LCY)"; Rec."Prepmt. VAT Amount Inv. (LCY)")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt. VAT Amount Inv. (LCY) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. VAT Base Amt."; Rec."Prepmt. VAT Base Amt.")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt. VAT Base Amt. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Prepmt. VAT Calc. Type"; Rec."Prepmt. VAT Calc. Type")
            //     {
            //         ToolTip = 'Specifies the value of the Prepmt. VAT Calc. Type field.';
            //         ApplicationArea = All;
            //     }
            //     field("Price Calculation Method"; Rec."Price Calculation Method")
            //     {
            //         ToolTip = 'Specifies the value of the Price Calculation Method field.';
            //         ApplicationArea = All;
            //     }
            //     field("Price description"; Rec."Price description")
            //     {
            //         ToolTip = 'Specifies the value of the Price description field.';
            //         ApplicationArea = All;
            //     }
            //     field("Profit %"; Rec."Profit %")
            //     {
            //         ToolTip = 'Specifies the value of the Profit % field.';
            //         ApplicationArea = All;
            //     }
            //     field("Promised Delivery Date"; Rec."Promised Delivery Date")
            //     {
            //         ToolTip = 'Specifies the date that you have promised to deliver the order, as a result of the Order Promising function.';
            //         ApplicationArea = All;
            //     }
            //     field("Purch. Order Line No."; Rec."Purch. Order Line No.")
            //     {
            //         ToolTip = 'Specifies the value of the Purch. Order Line No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Purchase Order No."; Rec."Purchase Order No.")
            //     {
            //         ToolTip = 'Specifies the value of the Purchase Order No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Purchasing Code"; Rec."Purchasing Code")
            //     {
            //         ToolTip = 'Specifies which purchaser is assigned to the vendor.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. Invoiced (Base)"; Rec."Qty. Invoiced (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. Invoiced (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
            //     {
            //         ToolTip = 'Specifies an auto-filled number if you have included Sales Unit of Measure on the item card and a quantity in the Qty. per Unit of Measure field.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. Shipped (Base)"; Rec."Qty. Shipped (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. Shipped (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. Shipped Not Invd. (Base)"; Rec."Qty. Shipped Not Invd. (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. Shipped Not Invd. (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. Shipped Not Invoiced"; Rec."Qty. Shipped Not Invoiced")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. Shipped Not Invoiced field.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. to Asm. to Order (Base)"; Rec."Qty. to Asm. to Order (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. to Asm. to Order (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. to Assemble to Order"; Rec."Qty. to Assemble to Order")
            //     {
            //         ToolTip = 'Specifies how many units of the blanket sales line quantity that you want to supply by assembly.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. to Invoice"; Rec."Qty. to Invoice")
            //     {
            //         ToolTip = 'Specifies the quantity that remains to be invoiced. It is calculated as Quantity - Qty. Invoiced.';
            //         ApplicationArea = All;
            //     }
            //     field("Qty. to Invoice (Base)"; Rec."Qty. to Invoice (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. to Invoice (Base) field.';
            //         ApplicationArea = All;
            //     }

            //     field("Qty. to Ship (Base)"; Rec."Qty. to Ship (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Qty. to Ship (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Quantity (Base)"; Rec."Quantity (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Quantity (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Quantity Invoiced"; Rec."Quantity Invoiced")
            //     {
            //         ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
            //         ApplicationArea = All;
            //     }
            //     field("Quantity Shipped"; Rec."Quantity Shipped")
            //     {
            //         ToolTip = 'Specifies how many units of the item on the line have been posted as shipped.';
            //         ApplicationArea = All;
            //     }
            //     field("Recalculate Invoice Disc."; Rec."Recalculate Invoice Disc.")
            //     {
            //         ToolTip = 'Specifies the value of the Recalculate Invoice Disc. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Requested Delivery Date"; Rec."Requested Delivery Date")
            //     {
            //         ToolTip = 'Specifies the date that the customer has asked for the order to be delivered.';
            //         ApplicationArea = All;
            //     }
            //     field(Reserve; Rec.Reserve)
            //     {
            //         ToolTip = 'Specifies whether a reservation can be made for items on this line.';
            //         ApplicationArea = All;
            //     }
            //     field("Reserved Qty. (Base)"; Rec."Reserved Qty. (Base)")
            //     {
            //         ToolTip = 'Specifies the reserved quantity of the item expressed in base units of measure.';
            //         ApplicationArea = All;
            //     }
            //     field("Reserved Quantity"; Rec."Reserved Quantity")
            //     {
            //         ToolTip = 'Specifies how many units of the item on the line have been reserved.';
            //         ApplicationArea = All;
            //     }
            //     field("Responsibility Center"; Rec."Responsibility Center")
            //     {
            //         ToolTip = 'Specifies the value of the Responsibility Center field.';
            //         ApplicationArea = All;
            //     }
            //     field("Ret. Qty. Rcd. Not Invd.(Base)"; Rec."Ret. Qty. Rcd. Not Invd.(Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Ret. Qty. Rcd. Not Invd.(Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Qty. Rcd. Not Invd."; Rec."Return Qty. Rcd. Not Invd.")
            //     {
            //         ToolTip = 'Specifies the value of the Return Qty. Rcd. Not Invd. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Qty. Received"; Rec."Return Qty. Received")
            //     {
            //         ToolTip = 'Specifies how many units of the item on the line have been posted as shipped.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Qty. Received (Base)"; Rec."Return Qty. Received (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Return Qty. Received (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Qty. to Receive"; Rec."Return Qty. to Receive")
            //     {
            //         ToolTip = 'Specifies the quantity of items that remain to be shipped.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Qty. to Receive (Base)"; Rec."Return Qty. to Receive (Base)")
            //     {
            //         ToolTip = 'Specifies the value of the Return Qty. to Receive (Base) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Rcd. Not Invd."; Rec."Return Rcd. Not Invd.")
            //     {
            //         ToolTip = 'Specifies the value of the Return Rcd. Not Invd. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Rcd. Not Invd. (LCY)"; Rec."Return Rcd. Not Invd. (LCY)")
            //     {
            //         ToolTip = 'Specifies the value of the Return Rcd. Not Invd. (LCY) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Receipt Line No."; Rec."Return Receipt Line No.")
            //     {
            //         ToolTip = 'Specifies the value of the Return Receipt Line No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Return Receipt No."; Rec."Return Receipt No.")
            //     {
            //         ToolTip = 'Specifies the value of the Return Receipt No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Returns Deferral Start Date"; Rec."Returns Deferral Start Date")
            //     {
            //         ToolTip = 'Specifies the starting date of the returns deferral period.';
            //         ApplicationArea = All;
            //     }
            //     field("Sell-to Customer No."; Rec."Sell-to Customer No.")
            //     {
            //         ToolTip = 'Specifies the number of the customer.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipment Date"; Rec."Shipment Date")
            //     {
            //         ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipment Line No."; Rec."Shipment Line No.")
            //     {
            //         ToolTip = 'Specifies the value of the Shipment Line No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipment No."; Rec."Shipment No.")
            //     {
            //         ToolTip = 'Specifies the value of the Shipment No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipped Not Inv. (LCY) No VAT"; Rec."Shipped Not Inv. (LCY) No VAT")
            //     {
            //         ToolTip = 'Specifies the value of the Shipped Not Invoiced (LCY) field.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipped Not Invoiced"; Rec."Shipped Not Invoiced")
            //     {
            //         ToolTip = 'Specifies the value of the Shipped Not Invoiced field.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipped Not Invoiced (LCY)"; Rec."Shipped Not Invoiced (LCY)")
            //     {
            //         ToolTip = 'Specifies the value of the Shipped Not Invoiced (LCY) Incl. VAT field.';
            //         ApplicationArea = All;
            //     }
            //     field("Shipping Time"; Rec."Shipping Time")
            //     {
            //         ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
            //         ApplicationArea = All;
            //     }
            //     field("Special Order"; Rec."Special Order")
            //     {
            //         ToolTip = 'Specifies that the item on the sales line is a special-order item.';
            //         ApplicationArea = All;
            //     }
            //     field("Special Order Purch. Line No."; Rec."Special Order Purch. Line No.")
            //     {
            //         ToolTip = 'Specifies the value of the Special Order Purch. Line No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Special Order Purchase No."; Rec."Special Order Purchase No.")
            //     {
            //         ToolTip = 'Specifies the value of the Special Order Purchase No. field.';
            //         ApplicationArea = All;
            //     }
            //     field("Substitution Available"; Rec."Substitution Available")
            //     {
            //         ToolTip = 'Specifies that a substitute is available for the item on the sales line.';
            //         ApplicationArea = All;
            //     }
            //     field(Subtype; Rec.Subtype)
            //     {
            //         ToolTip = 'Specifies the value of the Subtype field.';
            //         ApplicationArea = All;
            //     }
            //     field("System-Created Entry"; Rec."System-Created Entry")
            //     {
            //         ToolTip = 'Specifies the value of the System-Created Entry field.';
            //         ApplicationArea = All;
            //     }
            //     field(SystemCreatedAt; Rec.SystemCreatedAt)
            //     {
            //         ToolTip = 'Specifies the value of the SystemCreatedAt field.';
            //         ApplicationArea = All;
            //     }
            //     field(SystemCreatedBy; Rec.SystemCreatedBy)
            //     {
            //         ToolTip = 'Specifies the value of the SystemCreatedBy field.';
            //         ApplicationArea = All;
            //     }
            //     field(SystemId; Rec.SystemId)
            //     {
            //         ToolTip = 'Specifies the value of the SystemId field.';
            //         ApplicationArea = All;
            //     }
            //     field(SystemModifiedAt; Rec.SystemModifiedAt)
            //     {
            //         ToolTip = 'Specifies the value of the SystemModifiedAt field.';
            //         ApplicationArea = All;
            //     }
            //     field(SystemModifiedBy; Rec.SystemModifiedBy)
            //     {
            //         ToolTip = 'Specifies the value of the SystemModifiedBy field.';
            //         ApplicationArea = All;
            //     }
            //     field("Transaction Specification"; Rec."Transaction Specification")
            //     {
            //         ToolTip = 'Specifies the value of the Transaction Specification field.';
            //         ApplicationArea = All;
            //     }
            //     field("Transaction Type"; Rec."Transaction Type")
            //     {
            //         ToolTip = 'Specifies the value of the Transaction Type field.';
            //         ApplicationArea = All;
            //     }
            //     field("Transport Method"; Rec."Transport Method")
            //     {
            //         ToolTip = 'Specifies the value of the Transport Method field.';
            //         ApplicationArea = All;
            //     }
            //     field("Unit Cost"; Rec."Unit Cost")
            //     {
            //         ToolTip = 'Specifies the value of the Unit Cost field.';
            //         ApplicationArea = All;
            //     }
            //     // field("Unit of Measure (Cross Ref.)"; Rec."Unit of Measure (Cross Ref.)")
            //     // {
            //     //     ToolTip = 'Specifies the value of the Unit of Measure (Cross Ref.) field.';
            //     //     ApplicationArea = All;
            //     // }
            //     field("Unit Volume"; Rec."Unit Volume")
            //     {
            //         ToolTip = 'Specifies the value of the Unit Volume field.';
            //         ApplicationArea = All;
            //     }
            //     field("Units per Parcel"; Rec."Units per Parcel")
            //     {
            //         ToolTip = 'Specifies the value of the Units per Parcel field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT %"; Rec."VAT %")
            //     {
            //         ToolTip = 'Specifies the value of the VAT % field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT Base Amount"; Rec."VAT Base Amount")
            //     {
            //         ToolTip = 'Specifies the value of the VAT Base Amount field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
            //     {
            //         ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT Calculation Type"; Rec."VAT Calculation Type")
            //     {
            //         ToolTip = 'Specifies the value of the VAT Calculation Type field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT Clause Code"; Rec."VAT Clause Code")
            //     {
            //         ToolTip = 'Specifies the value of the VAT Clause Code field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT Difference"; Rec."VAT Difference")
            //     {
            //         ToolTip = 'Specifies the value of the VAT Difference field.';
            //         ApplicationArea = All;
            //     }
            //     field("VAT Identifier"; Rec."VAT Identifier")
            //     {
            //         ToolTip = 'Specifies the value of the VAT Identifier field.';
            //         ApplicationArea = All;
            //     }
            //     field("Whse. Outstanding Qty."; Rec."Whse. Outstanding Qty.")
            //     {
            //         ToolTip = 'Specifies how many units on the sales order line remain to be handled in warehouse documents.';
            //         ApplicationArea = All;
            //     }
            //     field("Whse. Outstanding Qty. (Base)"; Rec."Whse. Outstanding Qty. (Base)")
            //     {
            //         ToolTip = 'Specifies how many units on the sales order line remain to be handled in warehouse documents.';
            //         ApplicationArea = All;
            //     }
        }


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}