table 50204 "Salutation Text"
{
    CaptionML = DEU = 'Anrede / Grußformel';
    LookupPageId = 50204;

    fields
    {
        field(1; "Type"; Option)
        {
            CaptionML = DEU = 'Art';
            OptionMembers = Address,Salutation,Closing,Invitation;
            OptionCaptionML = DEU = 'Adresse,Anrede,Schlussformel,Einladung';
        }
        field(2; Gender; Option)
        {
            CaptionML = DEU = 'Geschlecht';
            OptionMembers = Undefined,Male,Female;
            OptionCaptionML = DEU = ' ,Männlich,Weiblich';
        }
        field(3; Text; Text[250])
        {
            CaptionML = DEU = 'Text';
        }
    }

    keys
    {
        key("Primary Key"; "Type", Gender, Text)
        {
            Clustered = true;
        }
    }
}