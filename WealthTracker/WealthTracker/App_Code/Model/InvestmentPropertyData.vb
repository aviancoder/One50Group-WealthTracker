Imports Microsoft.VisualBasic

Namespace WealthTracker.Models
    Public Class InvestmentPropertyData
        Public Property InvestmentPropertyIndex As Integer
        Public Property InvestmentPropertyName As String
        Public Property InvestmentPropertyPurchaseYear As Double
        Public Property InvestmentPropertyValue As Double
        Public Property InvestmentPropertyDebt As Double
        Public Property InvestmentPropertyRepaymentsBeginYear As Double
        Public Property InvestmentPropertyYearsToRepayDebt As Double
        Public Property InvestmentPropertyMonthlyRepayments As Double
        Public Property InvestmentPropertyNetHomeValueAtRetirement As Double
        Public Property InvestmentPropertyList As List(Of PropertyData)
    End Class

End Namespace
