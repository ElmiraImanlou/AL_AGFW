pageextension 50200 CompanyListExt extends Companies
{
    CaptionML = DEU = 'Adressverw. Synchronisation';
    Editable = false;
    layout
    {
        addfirst(factboxes)
        {
            part(CompanySynchSetupPart; "Company Synch. Setup Part")
            {
                SubPageLink = "Company Name" = field(Name);
            }
        }
    }
}