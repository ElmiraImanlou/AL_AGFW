page 50207 "Contact Sal. Preview Factbox"
{
    CaptionML = DEU = 'Vorschau (Anschrift/Anrede/etc.)';
    PageType = CardPart;
    SourceTable = Contact;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Address)
            {
                CaptionML = DEU = 'Anschrift';
                field(AddressPreview; AddressManagement.ContactFormatAddress(Rec))
                {
                    ShowCaption = false;
                    MultiLine = true;
                }
            }
            group(Salutation)
            {
                CaptionML = DEU = 'Anrede';
                field(SalutationPreview; AddressManagement.ContactFormatSalutation(Rec))
                {
                    ShowCaption = false;
                    MultiLine = true;
                }
            }

            group(Closing)
            {
                CaptionML = DEU = 'Schlussformel';
                field(ClosingPreview; AddressManagement.ContactFormatClosing(Rec))
                {
                    ShowCaption = false;
                    MultiLine = true;
                }
            }

            group(Invitation)
            {
                CaptionML = DEU = 'Einladungskarte';
                field(InvitationPreview; AddressManagement.ContactFormatInvitation(Rec))
                {
                    ShowCaption = false;
                    MultiLine = true;
                }
            }
        }
    }

    var
        AddressManagement: Codeunit "Address Management";
}