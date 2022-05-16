table 50203 "AM User Deputy"
{
    CaptionML = DEU = 'Stellvertreter';

    fields
    {
        field(1; "User Name"; Code[50])
        {
            CaptionML = DEU = 'Benutzer', ENU = 'User';
            TableRelation = User."User Name";
        }
        field(2; "Deputy User Name"; Code[50])
        {
            CaptionML = DEU = 'Stellvertreter', ENU = 'Deputy';
            TableRelation = User."User Name";
        }
        field(3; "From Date"; Date)
        {
            CaptionML = DEU = 'Von Datum', ENU = 'From Date';
        }
        field(4; "To Date"; Date)
        {
            CaptionML = DEU = 'Bis Datum', ENU = 'To Date';
        }
        field(5; Active; Boolean)
        {
            CaptionML = DEU = 'Vertretung aktiv', ENU = 'active';
            InitValue = true;
        }
        field(10; "Contact Editing"; Boolean)
        {
            CaptionML = DEU = 'Kontaktbearbeitung', ENU = 'Contact Editing';
        }
    }
    keys
    {
        key("Primary Key"; "User Name", "Deputy User Name", "From Date", "To Date")
        {
            Clustered = true;
        }
        key("Contact Deputy"; "Deputy User Name", "User Name", Active, "Contact Editing")
        {

        }
    }
}

