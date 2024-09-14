table 68100 "Extra Entry Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            tableRelation = "Source Code";
            NotBlank = false;
        }
        field(2; "G/L Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            tablerelation = "G/L Account" where("Account Type" = const(Posting), Blocked = const(false));
            NotBlank = false;
        }
        field(3; "G/L Account Create"; Code[20])
        {
            DataClassification = ToBeClassified;
            tablerelation = "G/L Account" where("Account Type" = const(Posting), Blocked = const(false));
            NotBlank = false;
        }
        field(4; "Bal. Account Create"; Code[20])
        {
            DataClassification = ToBeClassified;
            tablerelation = "G/L Account" where("Account Type" = const(Posting), Blocked = const(false));
            NotBlank = false;
        }
        field(5; "Posting Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Source Code", "G/L Account")
        {
            Clustered = true;
        }
    }
}