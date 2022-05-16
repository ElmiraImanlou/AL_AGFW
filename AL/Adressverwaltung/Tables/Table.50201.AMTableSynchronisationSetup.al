table 50201 "AM Table Synchronisation Setup"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;
    CaptionML = DEU = 'Synchronisation';

    fields
    {
        field(1; "Table No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Company Name"; Text[50])
        {
            CaptionML = DEU = 'Zielmandant';
            TableRelation = Company;
        }
        field(100; "Table Name"; Text[249])
        {
            CaptionML = DEU = 'Tabelle';
            FieldClass = FlowField;
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Table), "Object ID" = field("Table No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Table No.", "Company Name")
        {
            Clustered = true;
        }
        key(Company; "Company Name")
        {

        }
    }

    trigger OnInsert()
    var
        Company: Record Company;
    begin
        if IsDataPerCompany("Table No.") then
            Company.Get(Rec."Company Name");
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure IsDataPerCompany(TableNo: Integer): Boolean
    var
        Object: Record Object;
        CurrComp: Text;
    begin
        Object.SetRange(Type, Object.Type::TableData);
        Object.SetRange(ID, TableNo);
        CurrComp := Object.CurrentCompany();
        exit(CurrComp <> '');
    end;
}
