
Partial Class template
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        For i As Integer = 1 To 5

            Dim txt As Label = formMain.FindControl("InvestmentPropertyName" & i)
            If (Not (txt Is Nothing)) Then
                txt.Text = "Sample Investment Name " & i
            End If
        Next

    End Sub
End Class
