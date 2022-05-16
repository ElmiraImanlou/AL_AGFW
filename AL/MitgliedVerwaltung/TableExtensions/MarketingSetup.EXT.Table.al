tableextension 50213 "Marketing Setup EXt" extends "Marketing Setup"
{
    fields
    {
        field(50213; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            TableRelation = "No. Series";
        }
    }

    var
        myInt: Integer;
}