page 50201 "AM Synchronisation Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AM Table Synchronisation Setup";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(TableName; "Table Name")
                { }
                field(CompanyName; "Company Name")
                { }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SelectAllCompanies)
            {
                CaptionML = DEU = 'Alle Mandanten hinzufügen';
                Promoted = true;
                PromotedIsBig = true;
                ApplicationArea = All;
                Image = AllLines;

                trigger OnAction()
                var
                    SynchSetup: Record "AM Table Synchronisation Setup";
                begin
                    CurrPage.SaveRecord();

                    Table.SetRange("Object Type", Table."Object Type"::TableData);
                    Table.SetFilter("Object ID", Rec.GetFilter("Table No."));
                    if Table.FindSet(false) then
                        repeat
                            if Company.FindSet(false) then
                                repeat
                                    SynchSetup.Init();
                                    SynchSetup."Table No." := Table."Object ID";
                                    SynchSetup."Company Name" := Company.Name;
                                    if SynchSetup.Insert(true) then;
                                until Company.Next() = 0;
                        until Table.Next() = 0;

                    CurrPage.Update(false);
                end;
            }
        }
    }

    var
        Table: Record AllObj;
        Company: Record Company;
}
