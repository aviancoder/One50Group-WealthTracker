
Partial Class index

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not (IsPostBack)) Then
            Me.CurrentInvestmentPropertyName1.Text = "Current Property 1"
            Me.CurrentInvestmentPropertyValue1.Text = "1,000,000"
            Me.CurrentInvestmentPropertyDebt1.Text = "600,000"
        End If
    End Sub
End Class
