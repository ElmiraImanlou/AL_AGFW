table 50202 "AM Synchcronisation Entry"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Source Company"; Text[50])
        {
            TableRelation = Company.Name;
        }
        field(3; "Destination Company"; Text[50])
        {
            TableRelation = Company.Name;
        }
        field(4; "Record ID"; RecordId)
        {

        }
        field(5; "x Record ID"; RecordId)
        {

        }
        field(6; "Synchronisation Mode"; Option)
        {
            OptionMembers = Insert,Modify,Rename,Delete;
        }
        field(7; "Synchronisation Done"; DateTime)
        {

        }
        field(8; "Table No."; Integer)
        {

        }
        field(9; Success; Boolean)
        {

        }
        field(10; "Error Message"; Blob)
        {

        }
    }

    keys
    {
        key(PrimaryKey; "Entry No.")
        {
            Clustered = true;
        }
        key(OutstandingSynch; "Source Company", "Destination Company", "Record ID", "Synchronisation Mode", "Synchronisation Done")
        {

        }
        key(DestinationCompany; "Destination Company")
        {

        }
    }


}

