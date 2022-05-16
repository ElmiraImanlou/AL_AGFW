pageextension 50201 SalesRolecenterExt extends "Sales Manager Role Center"
{
    actions
    {
        addlast(sections)
        {
            group(AddressManagement)
            {
                CaptionML = DEU = 'Adressverwaltung';

                action(AMSetup)
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Adressverwaltung Einrichtung';
                    Image = Setup;
                    RunObject = Page "Address Management Setup";
                }
                action(Salutations)
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Anreden / Grußformeln';
                    Image = Salutation;
                    RunObject = Page "AM Salutation";
                }
                action(Deputies)
                {
                    ApplicationArea = All;
                    Image = User;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    RunObject = Page "AM User Deputies";
                }
            }
        }
    }
}