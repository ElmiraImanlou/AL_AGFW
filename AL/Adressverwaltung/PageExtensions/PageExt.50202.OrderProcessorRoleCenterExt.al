pageextension 50202 OrderProcessorRoleCenterExt extends "Order Processor Role Center"
{
    actions
    {
        addafter(SalesOrders)
        {

            action(Members)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Mitglieder';
                Image = Action;
                RunObject = Page "Members List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }

        }
        addlast(sections)
        {
            group(AddressManagement)
            {
                CaptionML = DEU = 'Adressverwaltung';

                action(AMSetup)
                {
                    CaptionML = DEU = 'Adressverwaltung Einrichtung';
                    Image = Setup;
                    RunObject = Page "Address Management Setup";
                }
                action(AMSynchEntries)
                {
                    CaptionML = DEU = 'Synchronisationsposten';
                    Image = Entries;
                    RunObject = Page "AM Synchcronisation Entries";
                }
                action(ContactCategories)
                {
                    CaptionML = DEU = 'Kontaktkategorien';
                    Image = Category;
                    RunObject = Page "Contact Category List";
                }
                action(AddressTypes)
                {
                    CaptionML = DEU = 'Adressarten', ENU = 'Address Types';
                    Image = Addresses;
                    RunObject = Page "Address Type List";
                }
                action(Salutations)
                {
                    CaptionML = DEU = 'Anreden', ENU = 'Salutations';
                    Image = Salutation;
                    RunObject = Page "AM Salutation";
                }
            }
        }
    }
}