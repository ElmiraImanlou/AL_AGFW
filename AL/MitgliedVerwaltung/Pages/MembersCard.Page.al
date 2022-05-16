page 50220 "Member Card"
{
    Caption = 'Mitglied Karte';
    PageType = ListPlus;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Members;
    // PromotedActionCategories = 'New,Process,Report,Navigate,Contact';
    PromotedActionCategories = 'Adresse,Beziehungsart,Kontakte,Versandadressen,Gruppen,Beiträge';

    layout
    {
        area(Content)
        {
            group(Company)
            {
                Caption = 'Unternehmen';

                field("Company No."; Rec."Company No.")
                {
                    ToolTip = 'Specifies the value of the UnternehmensNr. field.';
                    ApplicationArea = All;

                }

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Nr. field.';
                    ApplicationArea = All;
                    Importance = Standard;

                }
                field("Members Type"; Rec."Members Type")
                {
                    ToolTip = 'Specifies the value of the Mitgliedsart field.';
                    ApplicationArea = All;
                }
                field(MemberDate; Rec.MemberDate)
                {
                    ToolTip = 'Specifies the value of the Mitglied Seit field.';
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        InvoiceMember: Record "Member Price Of Invoice";
                        HistoryYear: Record "History Year";
                    begin

                        InvoiceMember.SetFilter("Contribution Type", "Members Type");
                        InvoiceMember.SetFilter(MemberNo, "No.");
                        if InvoiceMember.FindFirst() then begin
                            InvoiceMember.MemberDate := MemberDate;
                            InvoiceMember.Modify(true);
                        end else begin
                            InvoiceMember.Init();
                            InvoiceMember.Validate("Contribution Type", "Members Type");
                            InvoiceMember.Validate(MemberNo, "No.");
                            InvoiceMember.MemberDate := MemberDate;
                            InvoiceMember.Insert(true);
                        end;
                    end;
                }

                field("Company Name"; Rec."Company Name")
                {
                    ToolTip = 'Specifies the value of the Unternehmensname field.';
                    ApplicationArea = Basic, Suite;
                }
                // field("Parent Partner No."; Rec."Parent Partner No.")
                // {
                //     ToolTip = 'Specifies the value of the Parent Partner No. field.';
                //     ApplicationArea = All;
                // }


            }

            group("Communication")
            {
                Caption = 'Kommunikation';
                group("Details Address")
                {
                    Caption = 'Adresse';

                    field("Cont. Address"; Rec.Address)
                    {
                        Caption = 'Adresse';
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s address.';

                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the city where the contact is located.';
                    }

                }
                group(ContactDetails)
                {
                    Caption = 'Contact';
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s phone number.';
                    }
                    field("Mobile Phone No."; Rec."Mobile Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s mobile telephone number.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ToolTip = 'Specifies the value of the Email field.';
                        ApplicationArea = All;
                    }

                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the contact''s fax number.';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s web site.';
                    }

                }
            }

            part(Comment; "Comment Members")
            {
                Caption = 'Bemerkung';
                SubPageLink = "Table Name" = const(Contact), "No." = field("Company No.");
            }

        }

    }

    actions
    {
        area(Processing)
        {
            group("Address")
            {
                Caption = 'Adresse';
                action("Extra Address")
                {
                    Image = Addresses;
                    Caption = 'Zusatz Adresse';
                    PromotedCategory = New;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = page "Contact Address List";
                    RunPageLink = "Contact No." = field("Company No.");
                }
            }
            group("R&elationship Type")
            {
                Caption = 'Beziehungsart';
                Image = Relationship;
                action("Parent")
                {
                    Caption = 'Übergeordnete';
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'View or add Relationship for the record.';
                    Image = Relationship;
                    RunPageMode = Edit;
                    RunPageLink = MemberNo = field("No.");
                    RunObject = page "Parent Partner List";

                    trigger OnAction()
                    var
                        PrentPartner: Record "Parent Partner";
                    begin


                    end;

                }
                action("Subordinate")
                {
                    Caption = 'Untergeordnete';
                    ApplicationArea = All;
                    Image = Relationship;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'View or add Relationship for the record.';
                    RunPageMode = Edit;
                    RunPageLink = MemberNo = field("No.");
                    RunObject = page "Sub Partner List";

                }

            }
            action(Contact)
            {
                Caption = 'Kontakte';
                PromotedCategory = Report;
                Promoted = true;
                RunObject = page "Contact List";
                RunPageLink = "No." = field("Company No.");

            }
            action("Shipping Address")
            {
                Caption = 'Versandadressen';
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = page "Shipping Address List";
                RunPageLink = "Contact No." = field("Company No.");

            }
            action("Group")
            {
                Caption = 'Gruppen';
                Promoted = true;
                PromotedCategory = Category5;
                RunPageMode = Edit;
                RunPageLink = MemberNo = field("No.");
                RunObject = page "Partner Group List";

            }
            action("Price of Invoice")
            {
                Caption = 'Beiträge';
                Promoted = true;
                PromotedCategory = Category6;
                RunPageMode = Edit;
                RunPageLink = "Contribution Type" = field("Members Type"), MemberNo = field("No.");
                RunObject = page "Member Price of Invoice Card";
            }

        }
    }
    trigger OnAfterGetRecord()
    var
        ParentPart: Record "Parent Partner";
        SubPart: Record "Sub Partner";
    begin


    end;

    var
        ParentPartner: Record "Parent Partner";
        LineNo: Integer;
        contact: Record Contact;




}