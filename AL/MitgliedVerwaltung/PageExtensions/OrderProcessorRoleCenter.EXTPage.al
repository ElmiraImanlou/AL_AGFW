// pageextension 50213 "Order Proc. Role Cent. EXt" extends "Order Processor Role Center"
// {
//     layout
//     {
//         // Add changes to page layout here

//     }

//     actions
//     {
//         addafter(SalesOrders)
//         {

//             action(Members)
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Mitgliederverwaltung';
//                 Image = Action;
//                 RunObject = Page "Members List";
//                 ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
//             }

//         }
//     }
//     var
//         myInt: Integer;
// }