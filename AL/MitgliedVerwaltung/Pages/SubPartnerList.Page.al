page 50221 "Sub Partner List"
{
    PageType = List;
    Caption = 'Untergeordnete Partner List';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Sub Partner";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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

                field("Sub Relationship"; Rec."Sub Relationship")
                {
                    ToolTip = 'Specifies the value of the Sub Relationship field.';
                    ApplicationArea = All;
                }
                field("Sub Name"; Rec."Sub Name")
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                    // TableRelation = Contact.Name where(ParentPartner = const(false));
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
            }
        }
    }

}