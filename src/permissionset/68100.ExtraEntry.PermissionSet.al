permissionset 68100 "Extra Entry"
{
    Access = Internal;
    Assignable = true;
    Caption = 'Extra Entry', Locked = true;

    Permissions =
         codeunit "Extra Entry Function" = X,
         page "Extra Entry Setup Page" = X,
         table "Extra Entry Setup" = X,
         tabledata "Extra Entry Setup" = RIMD;
}