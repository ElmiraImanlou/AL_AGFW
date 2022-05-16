page 50222 "Parent Partner List"
{
    Caption = 'Übergeordnete Partner List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTableView = sorting("Contact No.");
    SourceTable = "Parent Partner";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                ShowCaption = false;

                // field("No."; Rec."No.")
                // {
                //     ToolTip = 'Specifies the value of the Code field.';
                //     ApplicationArea = All;
                // }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    ApplicationArea = All;
                }
                field("Parent Relationship"; Rec."Parent Relationship")
                {

                    ToolTip = 'Specifies the value of the Parent Relationship field.';
                    ApplicationArea = All;
                }
                field("Parent Name"; Rec."Parent Name")
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                    // TableRelation = contact.Name where(ParentPartner = const(true));
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ToolTip = 'Specifies the value of the Reference No. field.';
                    ApplicationArea = All;
                }
                field("From Date"; Rec."From Date")
                {
                    ToolTip = 'Specifies the value of the From Date field.';
                    ApplicationArea = All;
                }
                field("Until Date"; Rec."Until Date")
                {
                    ToolTip = 'Specifies the value of the Until Date field.';
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if "Until Date" < "From Date" then
                            Error('Bis Datum darf nicht kleiner als Von Datum sein');
                    end;
                }
                field("Member Directory"; Rec."Member Directory")
                {
                    ToolTip = 'Specifies the value of the Mitgliederverzeichnis field.';
                    ApplicationArea = All;
                }
                // field(MemberNo; Rec.MemberNo)
                // {
                //     ToolTip = 'Specifies the value of the Mitglied Nr. field.';
                //     ApplicationArea = All;
                // }




            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;


}