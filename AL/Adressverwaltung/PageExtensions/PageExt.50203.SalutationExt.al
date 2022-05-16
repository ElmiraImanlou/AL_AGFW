pageextension 50203 SalutationExt extends Salutations
{
    layout
    {
        addafter(Description)
        {
            field(Gender; Rec.Gender)
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    SetFilter("Gender Filter", '%1|%2', Rec.Gender, Rec.Gender::Undefined);
                end;
            }
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }
            field(Salutation; Rec.Salutation)
            {
                ApplicationArea = All;
            }
            field(Closing; Rec.Closing)
            {
                ApplicationArea = All;
            }
            field(Invitation; Rec.Invitation)
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec.SetFilter("Gender Filter", '%1|%2', Rec.Gender, Rec.Gender::Undefined);
    end;
}
