codeunit 68100 "Extra Entry Function"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostGenJnlLine', '', false, false)]
    local procedure OnAfterPostGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; Balancing: Boolean)
    var
        ExtraEntrySetup: Record "Extra Entry Setup";
        GlAccount: Code[40];
    begin
        if GenJournalLine.IsTemporary then
            exit;

        if (GenJournalLine."Account Type" <> GenJournalLine."Account Type"::"G/L Account") then
            exit;

        ExtraEntrySetup.SetRange("Source Code", GenJournalLine."Source Code");
        ExtraEntrySetup.SetRange("G/L Account", GenJournalLine."Account No.");
        //else
        //   ExtraEntrySetup.SetRange("G/L Account", GenJournalLine."Bal. Account No.");



        //if not ExtraEntrySetup.FindSet() then
        //     ExtraEntrySetup.SetRange("G/L Account", GenJournalLine."Bal. Account No.");

        if not ExtraEntrySetup.FindFirst() then
            exit;

        InsertGenJournalLine(GenJournalLine, ExtraEntrySetup);
    end;

    local procedure GetLastLineNo(var GenJournalLine: Record "Gen. Journal Line"): Integer
    var
        GenJournalLineLocal: Record "Gen. Journal Line";
    begin
        GenJournalLineLocal.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
        GenJournalLineLocal.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
        if GenJournalLineLocal.FindLast() then
            exit(GenJournalLineLocal."Line No." + 1);
    end;

    local procedure InsertGenJournalLine(var GenJournalLine: Record "Gen. Journal Line"; var ExtraEntrySetup: Record "Extra Entry Setup")
    var
        GenJournalLineLocal: Record "Gen. Journal Line";

    begin
        GenJournalLineLocal.Init();
        GenJournalLineLocal := GenJournalLine;
        GenJournalLineLocal."Line No." := GetLastLineNo(GenJournalLine);
        GenJournalLineLocal.Validate("Account No.", ExtraEntrySetup."G/L Account Create");
        GenJournalLineLocal.Validate("Bal. Account No.", ExtraEntrySetup."Bal. Account Create");
        if ExtraEntrySetup."Posting Description" <> '' then
            GenJournalLineLocal.Description := CopyStr(StrSubstNo(ExtraEntrySetup."Posting Description", GenJournalLineLocal.Description), 1, 100);
        GenJournalLineLocal.Insert(true);
    end;
}