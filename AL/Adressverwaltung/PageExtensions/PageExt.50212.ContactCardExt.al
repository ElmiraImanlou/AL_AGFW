pageextension 50212 "Contact Card Ext" extends "Contact Card"
{
    layout
    {
        addlast(General)
        {
            field("Assigned User"; Rec."Assigned User")
            {
                ApplicationArea = ALL;
            }
            field("Academic Degree"; Rec."Academic Degree")
            {
                ApplicationArea = ALL;
            }
            field(FormattedAddress; GetFormattedAddress())
            {
                ApplicationArea = ALL;
                Editable = false;
                CaptionML = DEU = 'Adresse (Vorschau)';
                MultiLine = true;
            }
        }
        addafter(General)
        {
            part(AdditionalAddresses; "Contact Address SubPage")
            {
                Caption = 'Zusätzliche Adressen';
                ApplicationArea = RelationshipMgmt;
                SubPageLink = "Contact No." = field("No.");
            }
            group("Management")
            {

                Visible = MemberVisible;
                Caption = 'Mitgliedverwaltung';

                field(ParentPartner; Rec.ParentPartner)
                {
                    ToolTip = 'Specifies the value of the Members  Parent Partner field.';
                    ApplicationArea = All;
                }
                field("Member Type"; Rec."Member Type")
                {
                    ToolTip = 'Specifies the value of the Member Type field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
        addfirst(factboxes)
        {
            part(ContactCategoriesSubpage; "Contact Category Ass. SubPage")
            {
                Caption = 'Kontakt Kategorie';
                SubPageLink = "Contact No." = field("No.");
            }
            part(ContactSalutationPreview; "Contact Sal. Preview Factbox")
            {
                SubPageLink = "No." = field("No.");
            }
        }
        modify(Type)
        {
            trigger OnAfterValidate()
            var
            begin
                if Rec.Type = Rec.Type::Company then begin
                    MemberVisible := true;
                    MemberVisible := false;
                    CurrPage.Update();
                end;
            end;
        }
    }
    actions
    {
        addfirst("C&ontact")
        {
            action(ContactCategorie)
            {
                CaptionML = DEU = 'Kategorien', ENU = 'Categories';
                ApplicationArea = All;
                RunObject = page "Contact Category Assign.";
                RunPageLink = "Contact No." = field("No.");
                Image = Category;
            }
            action(ContactAddresses)
            {
                CaptionML = DEU = 'Adressen', ENU = 'Addresses';
                ApplicationArea = All;
                RunObject = Page "Contact Address List";
                RunPageLink = "Contact No." = field("No.");
                Image = Addresses;
            }
        }
        modify("Alternati&ve Address")
        {
            Visible = false;
        }
        modify(Card)
        {
            Visible = false;
        }
        modify("Date Ranges")
        {
            Visible = false;
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if Rec.Type = Rec.Type::Company then MemberVisible := true
    End;

    trigger OnAfterGetRecord()
    var
        Member: Record Members;
    begin
        if Member.Get(Rec."No.") then
            Rec."Member Type" := Member."Members Type"
        else
            Rec."Member Type" := '';
    end;

    var
        MemberVisible: Boolean;

    local procedure GetFormattedAddress(): Text
    var
        AddressMgmt: Codeunit "Address Management";
    begin
        exit(AddressMgmt.ContactFormatAddress(Rec));
    end;
}
