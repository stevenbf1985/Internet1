
Partial Class ConTerremotos
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboPais.SelectedIndexChanged
        Dim fs As String
        fs = "co_pai={0}"
        If cboPais.SelectedIndex = 0 Then
            SqlDataSource2.FilterExpression = Nothing
        Else
            SqlDataSource2.FilterExpression = "co_pai={0}"
        End If
    End Sub

    Private Sub ConTerremotos_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None
    End Sub
End Class
