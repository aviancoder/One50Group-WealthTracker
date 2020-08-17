
Imports System.Web.Script.Serialization
Imports WealthTracker.Models

Partial Class _wealthtracker
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If (Not Page.IsPostBack) Then

            Dim basicDetails As New BasicDetails
            Dim output As New WealthTrackerOutputModel()
            'Get Basic Details from Form
            If (Not (Request.Form Is Nothing)) Then
                If (Not (Request.Form("ClientName") Is Nothing)) Then
                    basicDetails.ClientName = Request.Form("ClientName")
                    basicDetails.SpouseName = Request.Form("SpouseName")
                    basicDetails.ClientDateOfBirth = Request.Form("ClientDateOfBirth")
                    basicDetails.SpouseDateOfBirth = Request.Form("SpouseDateOfBirth")
                    basicDetails.ClientGrossIncome = ExtractNumericValueFromRequestForm("ClientGrossIncome")
                    basicDetails.SpouseGrossIncome = ExtractNumericValueFromRequestForm("SpouseGrossIncome")
                    basicDetails.ClientCashSavings = ExtractNumericValueFromRequestForm("ClientCashSavings")
                    basicDetails.SpouseCashSavings = ExtractNumericValueFromRequestForm("SpouseCashSavings")
                    basicDetails.ClientKiwiSaver = ExtractNumericValueFromRequestForm("ClientKiwiSaver")
                    basicDetails.SpouseKiwiSaver = ExtractNumericValueFromRequestForm("SpouseKiwiSaver")
                    basicDetails.ClientShareInvestments = ExtractNumericValueFromRequestForm("ClientShareInvestments")
                    basicDetails.SpouseShareInvestments = ExtractNumericValueFromRequestForm("SpouseShareInvestments")
                    basicDetails.ClientPropertyValue = ExtractNumericValueFromRequestForm("ClientPropertyValue")
                    basicDetails.ClientMortgage = ExtractNumericValueFromRequestForm("ClientMortgage")
                    basicDetails.ClientDebtCreditCard = ExtractNumericValueFromRequestForm("ClientDebtCreditCard")
                    basicDetails.SpouseDebtCreditCard = ExtractNumericValueFromRequestForm("SpouseDebtCreditCard")
                    basicDetails.DebtCreditCardRate = ExtractNumericValueFromRequestForm("DebtCreditCardRate")
                    basicDetails.DebtCreditCardRate = basicDetails.DebtCreditCardRate / 100
                    basicDetails.ClientDebtHire = ExtractNumericValueFromRequestForm("ClientDebtHire")
                    basicDetails.SpouseDebtHire = ExtractNumericValueFromRequestForm("SpouseDebtHire")
                    basicDetails.DebtHireRate = ExtractNumericValueFromRequestForm("DebtHireRate")
                    basicDetails.DebtHireRate = basicDetails.DebtHireRate / 100
                    basicDetails.ClientDebtPersonal = ExtractNumericValueFromRequestForm("ClientDebtPersonal")
                    basicDetails.SpouseDebtPersonal = ExtractNumericValueFromRequestForm("SpouseDebtPersonal")
                    basicDetails.DebtPersonalRate = ExtractNumericValueFromRequestForm("DebtPersonalRate")
                    basicDetails.DebtPersonalRate = basicDetails.DebtPersonalRate / 100
                    basicDetails.ClientDebtVehicle = ExtractNumericValueFromRequestForm("ClientDebtVehicle")
                    basicDetails.SpouseDebtVehicle = ExtractNumericValueFromRequestForm("SpouseDebtVehicle")
                    basicDetails.DebtVehicleRate = ExtractNumericValueFromRequestForm("DebtVehicleRate")
                    basicDetails.DebtVehicleRate = basicDetails.DebtVehicleRate / 100
                    basicDetails.ClientDebtOther = ExtractNumericValueFromRequestForm("ClientDebtOther")
                    basicDetails.SpouseDebtOther = ExtractNumericValueFromRequestForm("SpouseDebtOther")
                    basicDetails.DebtOtherRate = ExtractNumericValueFromRequestForm("DebtOtherRate")
                    basicDetails.DebtOtherRate = basicDetails.DebtOtherRate / 100

                    output.BasicDetails = basicDetails

                    output.InflationRate = 0.02
                    output.NetAssetsReturnOnInvestment = 0.04
                    output.AnnualCashSavingsContributions = 0
                    output.CashSavingsInterestRate = 0.015
                    output.KiwiSaverAverageInvestmentRate = 0.09
                    output.LifeExpectancyAverage = 88
                    output.KiwiSaverEmployeeContribution = 0.03
                    output.KiwiSaverEmployerContribution = 0.03
                    output.ShareBusinessGrowthRate = 0.1
                    output.HomeInterestRate = 0.04
                    output.HomeAnnualAppreciationRate = 0.06
                    output.HomeYearsToRepayMortgage = 15
                    output.ExpectedInheritance = New YearAmountData()
                    output.MaturingInvestment1 = New YearAmountData()
                    output.MaturingInvestment2 = New YearAmountData()
                    output.MaturingInvestment3 = New YearAmountData()
                    output.MaturingInvestment4 = New YearAmountData()
                    output.CurrentDebtYearsToRepay = 10
                    ' Compute
                    RecomputeModelFromFields(output, True)
                    ' Populate fields from model
                    PopulateFieldsFromModel(output)
                Else
                    Response.Redirect("index.aspx")
                End If
            Else
                Response.Redirect("index.aspx")
            End If
        End If
    End Sub

    Private Sub PopulateFieldsFromModel(ByVal _output As WealthTrackerOutputModel)

        Dim output As WealthTrackerOutputModel = _output

        Me.TotalAnnualIncome.Text = output.TotalAnnualIncome.ToString("#,##0")
        Me.YearsToRetirement.Text = output.YearsToRetirement.ToString("#,##0")
        Me.InflationRate.Text = (output.InflationRate * 100).ToString("#,##0")
        Me.AnnualIncomeForRetirement.Text = output.AnnualIncomeForRetirement.ToString("#,##0")
        Me.LessPension.Text = output.LessPension.ToString("#,##0")
        Me.TotalAnnualIncomeForRetirement.Text = output.TotalAnnualIncomeForRetirement.ToString("#,##0")

        Me.CurrentCashSavings.Text = output.CurrentCashSavings.ToString("#,##0")
        Me.AnnualCashSavingsContributions.Text = output.AnnualCashSavingsContributions.ToString("#,##0")
        Me.CashSavingsInterestRate.Text = (output.CashSavingsInterestRate * 100).ToString("#,##0")
        Me.TotalCashSavingsAtRetirement.Text = output.TotalCashSavingsAtRetirement.ToString("#,##0")

        Me.KiwiSaverAmount.Text = output.KiwiSaverAmount.ToString("#,##0")
        Me.KiwiSaverEmployeeContribution.Text = (output.KiwiSaverEmployeeContribution * 100).ToString("#,##0")
        Me.KiwiSaverAverageInvestmentRate.Text = (output.KiwiSaverAverageInvestmentRate * 100).ToString("#,##0")
        Me.KiwiSaverTotalAtRetirement.Text = output.KiwiSaverTotalAtRetirement.ToString("#,##0")

        Me.CurrentShareBusiness.Text = output.CurrentShareBusiness.ToString("#,##0")
        Me.ShareBusinessGrowthRate.Text = (output.ShareBusinessGrowthRate * 100).ToString("#,##0")
        Me.TotalShareBusinessAtRetirement.Text = output.TotalShareBusinessAtRetirement.ToString("#,##0")

        Me.HomeProperty.Text = output.HomeProperty.ToString("#,##0")
        Me.HomeMortgage.Text = output.HomeMortgage.ToString("#,##0")
        Me.HomeInterestRate.Text = (output.HomeInterestRate * 100).ToString("#,##0")
        Me.HomeAnnualAppreciationRate.Text = (output.HomeAnnualAppreciationRate * 100).ToString("#,##0")
        Me.HomeYearsToRepayMortgage.Text = output.HomeYearsToRepayMortgage.ToString("#,##0")
        Me.NetHomeValueAtRetirement.Text = output.NetHomeValueAtRetirement.ToString("#,##0")

        Me.NetAssetsRequired.Text = output.NetAssetsRequired.ToString("#,##0")
        Me.NetAssetsReturnOnInvestment.Text = (output.NetAssetsReturnOnInvestment * 100).ToString("#,##0")
        Me.TotalNetAssetsRequired.Text = output.TotalNetAssetsRequired.ToString("#,##0")

        Me.ExpectedInheritanceYear.Text = output.ExpectedInheritance.TargetYear.ToString("#,##0")
        Me.ExpectedInheritanceAmount.Text = output.ExpectedInheritance.Amount.ToString("#,##0")
        Me.MaturingInvestment1Year.Text = output.MaturingInvestment1.TargetYear.ToString("#,##0")
        Me.MaturingInvestment1Amount.Text = output.MaturingInvestment1.Amount.ToString("#,##0")
        Me.MaturingInvestment2Year.Text = output.MaturingInvestment2.TargetYear.ToString("#,##0")
        Me.MaturingInvestment2Amount.Text = output.MaturingInvestment2.Amount.ToString("#,##0")
        Me.MaturingInvestment3Year.Text = output.MaturingInvestment3.TargetYear.ToString("#,##0")
        Me.MaturingInvestment3Amount.Text = output.MaturingInvestment3.Amount.ToString("#,##0")
        Me.MaturingInvestment4Year.Text = output.MaturingInvestment4.TargetYear.ToString("#,##0")
        Me.MaturingInvestment4Amount.Text = output.MaturingInvestment4.Amount.ToString("#,##0")

        Me.CurrentDebt.Text = output.CurrentDebt.ToString("#,##0")
        Me.CurrentDebtMaxInterestRate.Text = (output.CurrentDebtMaxInterestRate * 100).ToString("#,##0")
        Me.CurrentDebtYearsToRepay.Text = output.CurrentDebtYearsToRepay.ToString("#,##0")
        Me.CurrentDebtMothlyRepayment.Text = output.CurrentDebtMothlyRepayment.ToString("#,##0")

        Me.InvestmentProperty1PurchaseYear.Text = output.InvestmentProperty1PurchaseYear.ToString("#,##0")
        Me.InvestmentProperty1Value.Text = output.InvestmentProperty1Value.ToString("#,##0")
        Me.InvestmentProperty1Debt.Text = output.InvestmentProperty1Debt.ToString("#,##0")
        Me.InvestmentProperty1RepaymentsBeginYear.Text = output.InvestmentProperty1RepaymentsBeginYear.ToString("#,##0")
        Me.InvestmentProperty1YearsToRepayDebt.Text = output.InvestmentProperty1YearsToRepayDebt.ToString("#,##0")
        Me.InvestmentProperty1MonthlyRepayments.Text = output.InvestmentProperty1MonthlyRepayments.ToString("#,##0")
        Me.InvestmentProperty1NetHomeValueAtRetirement.Text = output.InvestmentProperty1NetHomeValueAtRetirement.ToString("#,##0")

        Me.InvestmentProperty2PurchaseYear.Text = output.InvestmentProperty2PurchaseYear.ToString("#,##0")
        Me.InvestmentProperty2Value.Text = output.InvestmentProperty2Value.ToString("#,##0")
        Me.InvestmentProperty2Debt.Text = output.InvestmentProperty2Debt.ToString("#,##0")
        Me.InvestmentProperty2RepaymentsBeginYear.Text = output.InvestmentProperty2RepaymentsBeginYear.ToString("#,##0")
        Me.InvestmentProperty2YearsToRepayDebt.Text = output.InvestmentProperty2YearsToRepayDebt.ToString("#,##0")
        Me.InvestmentProperty2MonthlyRepayments.Text = output.InvestmentProperty2MonthlyRepayments.ToString("#,##0")
        Me.InvestmentProperty2NetHomeValueAtRetirement.Text = output.InvestmentProperty2NetHomeValueAtRetirement.ToString("#,##0")

        Me.InvestmentProperty3PurchaseYear.Text = output.InvestmentProperty3PurchaseYear.ToString("#,##0")
        Me.InvestmentProperty3Value.Text = output.InvestmentProperty3Value.ToString("#,##0")
        Me.InvestmentProperty3Debt.Text = output.InvestmentProperty3Debt.ToString("#,##0")
        Me.InvestmentProperty3RepaymentsBeginYear.Text = output.InvestmentProperty3RepaymentsBeginYear.ToString("#,##0")
        Me.InvestmentProperty3YearsToRepayDebt.Text = output.InvestmentProperty3YearsToRepayDebt.ToString("#,##0")
        Me.InvestmentProperty3MonthlyRepayments.Text = output.InvestmentProperty3MonthlyRepayments.ToString("#,##0")
        Me.InvestmentProperty3NetHomeValueAtRetirement.Text = output.InvestmentProperty3NetHomeValueAtRetirement.ToString("#,##0")

    End Sub

    Protected Sub btnUpdateChart_Click(sender As Object, e As EventArgs) Handles btnUpdateChart.Click
        ' get model from session
        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
        End If

        ' update model based from form data
        UpdateModelFromUpdatableFields(output)

        ' recompute values
        RecomputeModelFromFields(output, False)

        ' populate Fields
        PopulateFieldsFromModel(output)
    End Sub

    Private Sub UpdateModelFromUpdatableFields(ByRef _output As WealthTrackerOutputModel)

        _output.YearsToRetirement = Me.YearsToRetirement.Text
        _output.InflationRate = Me.InflationRate.Text
        _output.InflationRate = _output.InflationRate / 100
        _output.AnnualCashSavingsContributions = Me.AnnualCashSavingsContributions.Text
        _output.CashSavingsInterestRate = Me.CashSavingsInterestRate.Text
        _output.CashSavingsInterestRate = _output.CashSavingsInterestRate / 100
        _output.KiwiSaverEmployeeContribution = Me.KiwiSaverEmployeeContribution.Text
        _output.KiwiSaverEmployeeContribution = _output.KiwiSaverEmployeeContribution / 100
        _output.KiwiSaverAverageInvestmentRate = Me.KiwiSaverAverageInvestmentRate.Text
        _output.KiwiSaverAverageInvestmentRate = _output.KiwiSaverAverageInvestmentRate / 100
        _output.ShareBusinessGrowthRate = Me.ShareBusinessGrowthRate.Text
        _output.ShareBusinessGrowthRate = _output.ShareBusinessGrowthRate / 100
        _output.HomeInterestRate = Me.HomeInterestRate.Text
        _output.HomeInterestRate = _output.HomeInterestRate / 100
        _output.HomeAnnualAppreciationRate = Me.HomeAnnualAppreciationRate.Text
        _output.HomeAnnualAppreciationRate = _output.HomeAnnualAppreciationRate / 100
        _output.HomeYearsToRepayMortgage = Me.HomeYearsToRepayMortgage.Text
        _output.NetAssetsReturnOnInvestment = Me.NetAssetsReturnOnInvestment.Text
        _output.NetAssetsReturnOnInvestment = _output.NetAssetsReturnOnInvestment / 100

        Dim eiYearAmountData As New YearAmountData
        eiYearAmountData.TargetYear = Me.ExpectedInheritanceYear.Text
        eiYearAmountData.Amount = Me.ExpectedInheritanceAmount.Text
        _output.ExpectedInheritance = eiYearAmountData

        Dim mi1YearAmountData As New YearAmountData
        mi1YearAmountData.TargetYear = Me.MaturingInvestment1Year.Text
        mi1YearAmountData.Amount = Me.MaturingInvestment1Amount.Text
        _output.MaturingInvestment1 = mi1YearAmountData

        Dim mi2YearAmountData As New YearAmountData
        mi2YearAmountData.TargetYear = Me.MaturingInvestment2Year.Text
        mi2YearAmountData.Amount = Me.MaturingInvestment2Amount.Text
        _output.MaturingInvestment2 = mi2YearAmountData

        Dim mi3YearAmountData As New YearAmountData
        mi3YearAmountData.TargetYear = Me.MaturingInvestment3Year.Text
        mi3YearAmountData.Amount = Me.MaturingInvestment3Amount.Text
        _output.MaturingInvestment3 = mi3YearAmountData

        Dim mi4YearAmountData As New YearAmountData
        mi4YearAmountData.TargetYear = Me.MaturingInvestment4Year.Text
        mi4YearAmountData.Amount = Me.MaturingInvestment4Amount.Text
        _output.MaturingInvestment4 = mi4YearAmountData

        _output.CurrentDebtYearsToRepay = Me.CurrentDebtYearsToRepay.Text

        _output.InvestmentProperty1PurchaseYear = Me.InvestmentProperty1PurchaseYear.Text
        _output.InvestmentProperty1Value = Me.InvestmentProperty1Value.Text
        _output.InvestmentProperty1Debt = Me.InvestmentProperty1Debt.Text
        _output.InvestmentProperty1RepaymentsBeginYear = Me.InvestmentProperty1RepaymentsBeginYear.Text
        _output.InvestmentProperty1YearsToRepayDebt = Me.InvestmentProperty1YearsToRepayDebt.Text

        _output.InvestmentProperty2PurchaseYear = Me.InvestmentProperty2PurchaseYear.Text
        _output.InvestmentProperty2Value = Me.InvestmentProperty2Value.Text
        _output.InvestmentProperty2Debt = Me.InvestmentProperty2Debt.Text
        _output.InvestmentProperty2RepaymentsBeginYear = Me.InvestmentProperty2RepaymentsBeginYear.Text
        _output.InvestmentProperty2YearsToRepayDebt = Me.InvestmentProperty2YearsToRepayDebt.Text

        _output.InvestmentProperty3PurchaseYear = Me.InvestmentProperty3PurchaseYear.Text
        _output.InvestmentProperty3Value = Me.InvestmentProperty3Value.Text
        _output.InvestmentProperty3Debt = Me.InvestmentProperty3Debt.Text
        _output.InvestmentProperty3RepaymentsBeginYear = Me.InvestmentProperty3RepaymentsBeginYear.Text
        _output.InvestmentProperty3YearsToRepayDebt = Me.InvestmentProperty3YearsToRepayDebt.Text

    End Sub

    Private Sub RecomputeModelFromFields(ByRef _output As WealthTrackerOutputModel, ByVal _isFromBasicDetails As Boolean)
        Dim retirementAge As Integer = 65

        Dim wtCustomLogic As New WealthTracker.CustomLogic.WealthTrackerCustomLogic()
        If (_isFromBasicDetails = True) Then wtCustomLogic.FillGeneralData(retirementAge, _output)
        wtCustomLogic.FillIncomeData(_output)
        wtCustomLogic.FillCashSavings(_output)
        wtCustomLogic.FillKiwiData(_output, retirementAge)
        wtCustomLogic.FillSharesBusiness(_output)
        wtCustomLogic.FillHomeData(_output)
        wtCustomLogic.FillInheritanceInvestment(_output)
        wtCustomLogic.FillCurrentDebt(_output)
        wtCustomLogic.FillCurrentAssetsData(_output)
        wtCustomLogic.FillInvestmentProperty1(_output)
        wtCustomLogic.FillInvestmentProperty2(_output)
        wtCustomLogic.FillInvestmentProperty3(_output)
        wtCustomLogic.FillFinancialGoalData(_output)

        ' Store the object in session
        Session.Add("WEALTHTRACKER_CURRENTOBJECT", _output)

    End Sub

    Private Function ExtractNumericValueFromRequestForm(ByVal _key As String) As Double
        Dim retval As Double = 0
        If (Not (Request.Form Is Nothing)) Then
            If (Not (Request.Form(_key) Is Nothing)) Then
                If (String.IsNullOrEmpty(Request.Form(_key)) = False) Then
                    Dim formValue As String = Request.Form(_key)
                    formValue = formValue.Replace(",", "")
                    retval = Double.Parse(formValue)
                End If
            End If
        End If
        Return retval
    End Function
End Class
