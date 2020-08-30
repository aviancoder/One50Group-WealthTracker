Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Threading.Tasks

Namespace WealthTracker.Models

    Public Class WealthTrackerOutputModel

        Public Property TotalAnnualIncome As Double
        Public Property YearsToRetirement As Double
        Public Property InflationRate As Double
        Public Property AnnualIncomeForRetirement As Double
        Public Property LessPension As Double
        Public Property TotalAnnualIncomeForRetirement As Double
        Public Property CurrentCashSavings As Double
        Public Property AnnualCashSavingsContributions As Double
        Public Property CashSavingsInterestRate As Double
        Public Property TotalCashSavingsAtRetirement As Double
        Public Property CashSavingsList As List(Of CashSavingsData)
        Public Property CurrentShareBusiness As Double
        Public Property ShareBusinessGrowthRate As Double
        Public Property TotalShareBusinessAtRetirement As Double
        Public Property ShareBusinessList As List(Of ShareBusinessData)
        Public Property HomeProperty As Double
        Public Property HomeMortgage As Double
        Public Property HomeInterestRate As Double
        Public Property HomeAnnualAppreciationRate As Double
        Public Property HomeYearsToRepayMortgage As Double
        Public Property NetHomeValueAtRetirement As Double
        Public Property HomeList As List(Of PropertyData)
        Public Property BasicDetails As BasicDetails
        Public Property KiwiSaverAmountClient As Double
        Public Property KiwiSaverTotalAtRetirementClient As Double
        Public Property KiwiSaverAverageInvestmentRateClient As Double
        Public Property KiwiSaverEmployeeContributionClient As Double
        Public Property KiwiSaverEmployerContributionClient As Double
        Public Property KiwiSaverAmountSpouse As Double
        Public Property KiwiSaverTotalAtRetirementSpouse As Double
        Public Property KiwiSaverAverageInvestmentRateSpouse As Double
        Public Property KiwiSaverEmployeeContributionSpouse As Double
        Public Property KiwiSaverEmployerContributionSpouse As Double
        Public Property LifeExpectancyAverage As Double
        Public Property TotalLivingExpensesAverage As Double
        Public Property TotalSuperAmount As Double
        Public Property EstimatedTotalKiwiSaverAmount As Double
        Public Property SurplusShortfallAmount As Double
        Public Property KiwiSaverListClient As List(Of KiwiSaverData)
        Public Property KiwiSaverListSpouse As List(Of KiwiSaverData)
        Public Property NetAssetsRequired As Double
        Public Property NetAssetsReturnOnInvestment As Double
        Public Property TotalNetAssetsRequired As Double
        Public Property ExpectedInheritance As YearAmountData
        Public Property MaturingInvestment1 As YearAmountData
        Public Property MaturingInvestment2 As YearAmountData
        Public Property MaturingInvestment3 As YearAmountData
        Public Property MaturingInvestment4 As YearAmountData
        Public Property InheritanceInvestmentList As List(Of InheritanceInvestmentData)
        Public Property CurrentDebt As Double
        Public Property CurrentDebtMaxInterestRate As Double
        Public Property CurrentDebtYearsToRepay As Integer
        Public Property CurrentDebtMothlyRepayment As Integer
        Public Property CurrentDebtList As List(Of CurrentDebtData)
        Public Property InvestmentProperty1PurchaseYear As Double
        Public Property InvestmentProperty1Value As Double
        Public Property InvestmentProperty1Debt As Double
        Public Property InvestmentProperty1RepaymentsBeginYear As Double
        Public Property InvestmentProperty1YearsToRepayDebt As Double
        Public Property InvestmentProperty1MonthlyRepayments As Double
        Public Property InvestmentProperty1NetHomeValueAtRetirement As Double
        Public Property InvestmentProperty1List As List(Of PropertyData)
        Public Property InvestmentProperty2PurchaseYear As Double
        Public Property InvestmentProperty2Value As Double
        Public Property InvestmentProperty2Debt As Double
        Public Property InvestmentProperty2RepaymentsBeginYear As Double
        Public Property InvestmentProperty2YearsToRepayDebt As Double
        Public Property InvestmentProperty2MonthlyRepayments As Double
        Public Property InvestmentProperty2NetHomeValueAtRetirement As Double
        Public Property InvestmentProperty2List As List(Of PropertyData)
        Public Property InvestmentProperty3PurchaseYear As Double
        Public Property InvestmentProperty3Value As Double
        Public Property InvestmentProperty3Debt As Double
        Public Property InvestmentProperty3RepaymentsBeginYear As Double
        Public Property InvestmentProperty3YearsToRepayDebt As Double
        Public Property InvestmentProperty3MonthlyRepayments As Double
        Public Property InvestmentProperty3NetHomeValueAtRetirement As Double
        Public Property InvestmentProperty3List As List(Of PropertyData)
        Public Property CurrentInvestmentPropertyList As List(Of InvestmentPropertyData)
        Public Property InvestmentPropertyList As List(Of InvestmentPropertyData)
        Public Property CurrentAssetsList As List(Of CurrentAssetsData)
        Public Property FinancialGoalList As List(Of FinancialGoalData)
    End Class

End Namespace
