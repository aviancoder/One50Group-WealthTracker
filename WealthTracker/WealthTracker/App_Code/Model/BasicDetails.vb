Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Threading.Tasks

Namespace WealthTracker.Models

    Public Class BasicDetails
        Public Property ClientName As String
        Public Property SpouseName As String
        Public Property ClientDateOfBirth As DateTime
        Public Property SpouseDateOfBirth As DateTime
        Public Property ClientGrossIncome As Double
        Public Property SpouseGrossIncome As Double
        Public Property ClientCashSavings As Double
        Public Property SpouseCashSavings As Double
        Public Property ClientKiwiSaver As Double
        Public Property SpouseKiwiSaver As Double
        Public Property ClientShareInvestments As Double
        Public Property SpouseShareInvestments As Double
        Public Property ClientPropertyValue As Double
        Public Property ClientMortgage As Double
        Public Property ClientDebtCreditCard As Double
        Public Property SpouseDebtCreditCard As Double
        Public Property DebtCreditCardRate As Double
        Public Property ClientDebtHire As Double
        Public Property SpouseDebtHire As Double
        Public Property DebtHireRate As Double
        Public Property ClientDebtPersonal As Double
        Public Property SpouseDebtPersonal As Double
        Public Property DebtPersonalRate As Double
        Public Property ClientDebtVehicle As Double
        Public Property SpouseDebtVehicle As Double
        Public Property DebtVehicleRate As Double
        Public Property ClientDebtOther As Double
        Public Property SpouseDebtOther As Double
        Public Property DebtOtherRate As Double
    End Class

End Namespace
