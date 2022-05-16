pageextension 50302 "Sales Invoice Header Page EXT" extends "Posted Sales Invoices"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(Invoice)
        {

            action(DeleteSalesINvoice)
            {
                Caption = 'Löschen Beleg';
                Image = Delete;
                trigger OnAction()
                var
                    DeleteCU: Codeunit Delete;
                begin

                    // DeleteCU.DeleteSalesINvoice(Rec);
                    // DeleteCU.DeleteGLEntries();
                    // DeleteCU.DeleteCustomerPosten();
                end;
            }

        }
    }

    var
        myInt: Integer;
}