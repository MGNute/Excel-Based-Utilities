Attribute VB_Name = "Module1"
Sub clearBelowDiag()
Attribute clearBelowDiag.VB_ProcData.VB_Invoke_Func = "t\n14"

Dim mid As VbMsgBoxResult

mid = MsgBox("Clear Middle Diagonal?", vbYesNo)

If mid = vbYes Then foo = 1 Else foo = 2


Dim myRng As Range
Dim width As Long

Set myRng = Selection

If myRng.Rows.Count <> myRng.Columns.Count Then
    MsgBox "Range is not Square. Try again."
Else
    width = myRng.Rows.Count
    For n = 2 To width
        For m = (width - n + foo) To width
            myRng.Cells(n, m).ClearContents
        Next
    Next
    MsgBox "Success."
End If


End Sub
