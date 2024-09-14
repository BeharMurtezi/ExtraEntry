page 68100 "Extra Entry Setup Page"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Extra Entry Setup";
    Caption = 'Extra Entry Setup';
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the source code for the extra entry setup.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the G/L account based on for the extra entry';
                }
                field("G/L Account Create"; Rec."G/L Account Create")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the G/L account for the extra entry';
                }
                field("Bal. Account Create"; Rec."Bal. Account Create")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the balance account for the extra entry';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the posting description for the extra entry';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("New")
            {
                ApplicationArea = All;
                Caption = 'New';
                Image = New;

                trigger OnAction()
                begin
                    // CurrPage.Insert(true);
                end;
            }
        }
    }
}