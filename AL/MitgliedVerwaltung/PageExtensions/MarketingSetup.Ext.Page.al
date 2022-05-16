pageextension 50214 "Marketing Setup Ext." extends "Marketing Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Contact Nos.")
        {

            field("Member No."; Rec."Member No.")
            {
                ToolTip = 'Specifies the value of the Contact Nos. field.';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}