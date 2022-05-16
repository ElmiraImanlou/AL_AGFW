tableextension 50201 SalutationFormulaExt extends Salutation
{
    fields
    {
        field(50200; Gender; Option)
        {
            OptionMembers = Undefined,Male,Female;
            OptionCaptionML = DEU = ' ,Männlich,Weiblich';
        }
        field(50201; "Address"; Text[250])
        {
            CaptionML = DEU = 'Adresse';
            TableRelation = "Salutation Text".Text where(Type = const(Address), Gender = field("Gender Filter"));
        }
        field(50202; "Salutation"; Text[250])
        {
            CaptionML = DEU = 'Anrede';
            TableRelation = "Salutation Text".Text where(Type = const(Salutation), Gender = field("Gender Filter"));
        }
        field(50203; "Closing"; Text[250])
        {
            CaptionML = DEU = 'Schlussformel';
            TableRelation = "Salutation Text".Text where(Type = const(Closing), Gender = field("Gender Filter"));
        }
        field(50204; "Invitation"; Text[250])
        {
            CaptionML = DEU = 'Einladung';
            TableRelation = "Salutation Text".Text where(Type = const(Invitation), Gender = field("Gender Filter"));
        }
        field(50205; "Gender Filter"; Option)
        {
            FieldClass = FlowFilter;
            OptionMembers = ,Male,Female;
            OptionCaptionML = DEU = ' ,Männlich,Weiblich';
        }
    }
}