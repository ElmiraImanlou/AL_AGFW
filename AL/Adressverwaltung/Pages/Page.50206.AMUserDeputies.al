page 50206 "AM User Deputies"
{
    PageType = List;
    SourceTable = "AM User Deputy";
    SourceTableView = sorting("User Name", "Deputy User Name", "From Date", "To Date") where("User Name" = filter(<> ''));
    CaptionML = DEU = 'Stellvertreter', ENU = 'Deputies';
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Users)
            {
                field("User Name"; "User Name")
                {
                    Visible = not ShowAdmins;

                }
                field("Deputy User Name"; "Deputy User Name")
                {
                    Visible = not ShowAdmins;

                }
                field("Admin User Name"; "Deputy User Name")
                {
                    Visible = ShowAdmins;
                    CaptionML = DEU = 'Administrator', ENU = 'Administrator';
                }
                field("From Date"; "From Date") { }
                field("To Date"; "To Date") { }
                field(Active; Active)
                {
                    Visible = not ShowAdmins;
                }
                field("Contact Editing"; "Contact Editing") { }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(ShowAdmins)
            {
                CaptionML = DEU = 'Administratoren', ENU = 'Administrators';
                Image = Administration;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = not ShowAdmins;

                trigger OnAction()
                begin
                    ToggleShowAdmins();
                end;
            }
            action(ShowDeputies)
            {
                CaptionML = DEU = 'Stellvertreter', ENU = 'Deputies';
                Image = User;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = ShowAdmins;

                trigger OnAction()
                begin
                    ToggleShowAdmins();
                end;
            }
        }
    }

    var
        ShowAdmins: Boolean;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Active := true;
    end;

    trigger OnInsertRecord(BelowXRec: Boolean): Boolean
    begin
        if not ShowAdmins then
            Rec.TestField("User Name");
        Rec.TestField("Deputy User Name");
    end;

    local procedure ToggleShowAdmins()
    begin
        ShowAdmins := not ShowAdmins;

        FilterGroup(4);
        if ShowAdmins then
            SetRange("User Name", '')
        else
            SetFilter("User Name", '<>%1', '');
        FilterGroup(0);

        if ShowAdmins then
            CurrPage.Caption('Administratoren')
        else
            CurrPage.Caption('Stellvertreter');
        CurrPage.Update(true);
    end;
}