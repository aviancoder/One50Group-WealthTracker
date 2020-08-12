Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Security.Cryptography.X509Certificates
Imports System.Threading.Tasks
Imports WealthTracker.Models

Namespace WealthTracker.CustomLogic
    Public Class WealthTrackerCustomLogic
        Private defaultPensionAmount As Double = 32892

#Region "Wealth Tracker Model Fill Up"

        Public Sub FillGeneralData(ByVal _retirementAge As Integer, ByRef _output As WealthTrackerOutputModel)

            Dim clientAge As Integer = GetAge(_output.BasicDetails.ClientDateOfBirth)
            Dim spouseAge As Integer = GetAge(_output.BasicDetails.SpouseDateOfBirth)

            If clientAge > spouseAge Then
                _output.YearsToRetirement = _retirementAge - spouseAge
            Else
                _output.YearsToRetirement = _retirementAge - clientAge
            End If

            _output.LifeExpectancyAverage = 91.5
        End Sub

        Public Sub FillIncomeData(ByRef _output As WealthTrackerOutputModel)
            Dim salaryNow As Double = _output.BasicDetails.ClientGrossIncome + _output.BasicDetails.SpouseGrossIncome
            _output.TotalAnnualIncome = salaryNow
            _output.AnnualIncomeForRetirement = GetFutureValue(_output.TotalAnnualIncome, _output.InflationRate, CInt(_output.YearsToRetirement))
            _output.LessPension = GetFutureValue(defaultPensionAmount, 0.02, CInt(_output.YearsToRetirement))
            _output.TotalAnnualIncomeForRetirement = _output.AnnualIncomeForRetirement - _output.LessPension
        End Sub

        Public Sub FillCashSavings(ByRef _output As WealthTrackerOutputModel)
            _output.CurrentCashSavings = _output.BasicDetails.ClientCashSavings + _output.BasicDetails.SpouseCashSavings
            _output.CashSavingsList = GetCashSavingsTable(_output)
            Dim yearsToRetirement As Integer = _output.YearsToRetirement
            Dim maxItem = _output.CashSavingsList.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
            _output.TotalCashSavingsAtRetirement = maxItem.CumulativeCashSavings
        End Sub

        Public Sub FillSharesBusiness(ByRef _output As WealthTrackerOutputModel)
            _output.CurrentShareBusiness = _output.BasicDetails.ClientShareInvestments + _output.BasicDetails.SpouseShareInvestments
            _output.ShareBusinessList = GetShareBusinessTable(_output)
            Dim yearsToRetirement As Integer = _output.YearsToRetirement
            Dim maxItem = _output.ShareBusinessList.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
            _output.TotalShareBusinessAtRetirement = maxItem.CumulativeShareBusiness
        End Sub

        Public Sub FillKiwiData(ByRef _output As WealthTrackerOutputModel, ByVal _retirementAge As Integer)
            _output.KiwiSaverAmount = _output.BasicDetails.ClientKiwiSaver + _output.BasicDetails.SpouseKiwiSaver
            _output.TotalLivingExpensesAverage = 650 * 52 * (_output.LifeExpectancyAverage - _retirementAge)
            _output.TotalSuperAmount = 375 * 52 * (_output.LifeExpectancyAverage - _retirementAge)
            Dim klist As List(Of KiwiSaverData) = GetKiwiSaverTable(_output.TotalAnnualIncome, _output)
            _output.KiwiSaverList = klist
            Dim yearsToRetirement As Integer = _output.YearsToRetirement
            Dim kdata = klist.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
            _output.EstimatedTotalKiwiSaverAmount = kdata.CumulativeKiwiSaver
            _output.SurplusShortfallAmount = _output.TotalSuperAmount + _output.KiwiSaverTotalAtRetirement - _output.TotalLivingExpensesAverage
            _output.KiwiSaverTotalAtRetirement = _output.EstimatedTotalKiwiSaverAmount
        End Sub

        Public Sub FillHomeData(ByRef _output As WealthTrackerOutputModel)
            _output.HomeProperty = _output.BasicDetails.ClientPropertyValue
            _output.HomeMortgage = _output.BasicDetails.ClientMortgage
            Dim yearsToRetirement As Integer = _output.YearsToRetirement
            Dim homeList As List(Of PropertyData) = GetPropertyTable(_output.BasicDetails.ClientPropertyValue, _output.HomeAnnualAppreciationRate, 1, _output.BasicDetails.ClientMortgage, _output.HomeInterestRate, _output.HomeYearsToRepayMortgage, 0, yearsToRetirement)
            _output.HomeList = homeList
            Dim hdata = homeList.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
            _output.NetHomeValueAtRetirement = hdata.NetPropertyWealth
        End Sub

        Public Sub FillInheritanceInvestment(ByRef _output As WealthTrackerOutputModel)
            Dim inheritanceInvestment As List(Of InheritanceInvestmentData) = GetInheritanceHomeTable(_output)
            _output.InheritanceInvestmentList = inheritanceInvestment
        End Sub

        Public Sub FillCurrentDebt(ByRef _output As WealthTrackerOutputModel)
            Dim basicDetails As BasicDetails = _output.BasicDetails
            'get the total
            _output.CurrentDebt = basicDetails.ClientDebtCreditCard + basicDetails.ClientDebtHire + basicDetails.ClientDebtPersonal + basicDetails.ClientDebtVehicle + basicDetails.ClientDebtOther _
                + basicDetails.SpouseDebtCreditCard + basicDetails.SpouseDebtHire + basicDetails.SpouseDebtPersonal + basicDetails.SpouseDebtVehicle + basicDetails.SpouseDebtOther
            ' get the highest interest rate, bubble method
            _output.CurrentDebtMaxInterestRate = basicDetails.DebtCreditCardRate
            If (basicDetails.DebtHireRate > _output.CurrentDebtMaxInterestRate) Then _output.CurrentDebtMaxInterestRate = basicDetails.DebtHireRate
            If (basicDetails.DebtPersonalRate > _output.CurrentDebtMaxInterestRate) Then _output.CurrentDebtMaxInterestRate = basicDetails.DebtPersonalRate
            If (basicDetails.DebtVehicleRate > _output.CurrentDebtMaxInterestRate) Then _output.CurrentDebtMaxInterestRate = basicDetails.DebtVehicleRate
            If (basicDetails.DebtOtherRate > _output.CurrentDebtMaxInterestRate) Then _output.CurrentDebtMaxInterestRate = basicDetails.DebtOtherRate
            ' get the list
            Dim mList As List(Of MortgageData) = GenerateMortgageTable(_output.CurrentDebt, _output.CurrentDebtMaxInterestRate, _output.CurrentDebtYearsToRepay)
            'get monthly repayment
            If (mList.Count() > 0) Then
                _output.CurrentDebtMothlyRepayment = mList.Item(0).Payment / 12
            End If
            ' build the list
            Dim cdList As New List(Of CurrentDebtData)
            For i As Integer = 1 To _output.YearsToRetirement
                Dim mdata As New CurrentDebtData
                mdata.YearsToRetire = i
                If (i < mList.Count()) Then
                    mdata.CumulativeCurrentDebt = mList.Item(i - 1).EndingBalance
                End If
                cdList.Add(mdata)
            Next
            _output.CurrentDebtList = cdList

        End Sub

        Public Sub FillInvestmentProperty1(ByRef _output As WealthTrackerOutputModel)
            If ((_output.InvestmentProperty1PurchaseYear > 0) And (_output.InvestmentProperty1Value > 0)) Then
                Dim yearsToRetirement As Integer = _output.YearsToRetirement
                Dim pList As List(Of PropertyData) = GetPropertyTable(_output.InvestmentProperty1Value, _output.HomeAnnualAppreciationRate, _output.InvestmentProperty1PurchaseYear, _output.InvestmentProperty1Debt, _output.HomeInterestRate, _output.InvestmentProperty1YearsToRepayDebt, _output.InvestmentProperty1RepaymentsBeginYear, yearsToRetirement)
                _output.InvestmentProperty1List = pList
                If (pList.Count() > 0) Then
                    _output.InvestmentProperty1MonthlyRepayments = pList.Item(0).YearlyPayment / 12
                End If
                Dim hdata = pList.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
                _output.InvestmentProperty1NetHomeValueAtRetirement = hdata.NetPropertyWealth
            End If
        End Sub

        Public Sub FillInvestmentProperty2(ByRef _output As WealthTrackerOutputModel)
            If ((_output.InvestmentProperty2PurchaseYear > 0) And (_output.InvestmentProperty2Value > 0)) Then
                Dim yearsToRetirement As Integer = _output.YearsToRetirement
                Dim pList As List(Of PropertyData) = GetPropertyTable(_output.InvestmentProperty2Value, _output.HomeAnnualAppreciationRate, _output.InvestmentProperty2PurchaseYear, _output.InvestmentProperty2Debt, _output.HomeInterestRate, _output.InvestmentProperty2YearsToRepayDebt, _output.InvestmentProperty2RepaymentsBeginYear, yearsToRetirement)
                _output.InvestmentProperty2List = pList
                If (pList.Count() > 0) Then
                    _output.InvestmentProperty2MonthlyRepayments = pList.Item(0).YearlyPayment / 12
                End If
                Dim hdata = pList.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
                _output.InvestmentProperty2NetHomeValueAtRetirement = hdata.NetPropertyWealth
            End If
        End Sub

        Public Sub FillInvestmentProperty3(ByRef _output As WealthTrackerOutputModel)
            If ((_output.InvestmentProperty3PurchaseYear > 0) And (_output.InvestmentProperty3Value > 0)) Then
                Dim yearsToRetirement As Integer = _output.YearsToRetirement
                Dim pList As List(Of PropertyData) = GetPropertyTable(_output.InvestmentProperty3Value, _output.HomeAnnualAppreciationRate, _output.InvestmentProperty3PurchaseYear, _output.InvestmentProperty3Debt, _output.HomeInterestRate, _output.InvestmentProperty3YearsToRepayDebt, _output.InvestmentProperty3RepaymentsBeginYear, yearsToRetirement)
                _output.InvestmentProperty3List = pList
                If (pList.Count() > 0) Then
                    _output.InvestmentProperty3MonthlyRepayments = pList.Item(0).YearlyPayment / 12
                End If
                Dim hdata = pList.Where(Function(x) x.YearsToRetire = yearsToRetirement).FirstOrDefault()
                _output.InvestmentProperty3NetHomeValueAtRetirement = hdata.NetPropertyWealth
            End If
        End Sub

        Public Sub FillCurrentAssetsData(ByRef _output As WealthTrackerOutputModel)
            Dim dataList As New List(Of CurrentAssetsData)()
            Dim csList As List(Of CashSavingsData) = _output.CashSavingsList
            Dim sbList As List(Of ShareBusinessData) = _output.ShareBusinessList
            Dim kList As List(Of KiwiSaverData) = _output.KiwiSaverList
            Dim hList As List(Of PropertyData) = _output.HomeList
            Dim iiList As List(Of InheritanceInvestmentData) = _output.InheritanceInvestmentList
            Dim dList As List(Of CurrentDebtData) = _output.CurrentDebtList

            For i As Integer = 1 To _output.YearsToRetirement
                Dim idx As Integer = i
                Dim csData = csList.Where(Function(x) x.YearsToRetire = idx).FirstOrDefault()
                Dim sbData = sbList.Where(Function(x) x.YearsToRetire = idx).FirstOrDefault()
                Dim kData = kList.Where(Function(x) x.YearsToRetire = idx).FirstOrDefault()
                Dim hData = hList.Where(Function(x) x.YearsToRetire = idx).FirstOrDefault()
                Dim iiData = iiList.Where(Function(x) x.YearsToRetire = idx).FirstOrDefault()
                Dim dData = dList.Where(Function(x) x.YearsToRetire = idx).FirstOrDefault()

                Dim currentAssetAmount As Double = csData.CumulativeCashSavings + sbData.CumulativeShareBusiness + kData.CumulativeKiwiSaver + hData.NetPropertyWealth + iiData.CumulativeInheritanceInvestment - dData.CumulativeCurrentDebt
                Dim data As New CurrentAssetsData()
                data.YearsToRetire = i
                data.CumulativeCurrentAssets = currentAssetAmount
                dataList.Add(data)
            Next

            _output.CurrentAssetsList = dataList
        End Sub

        Public Sub FillFinancialGoalData(ByRef _output As WealthTrackerOutputModel)

            Dim netAssetsRequired As Double = 0
            netAssetsRequired = _output.TotalAnnualIncomeForRetirement / _output.NetAssetsReturnOnInvestment
            _output.NetAssetsRequired = netAssetsRequired

            Dim initialFinancialGoal As Double = _output.HomeProperty + ((_output.TotalAnnualIncome - defaultPensionAmount) / 0.05)
            Dim fvHome As Double = GetFutureValue(_output.HomeProperty, _output.HomeAnnualAppreciationRate, _output.YearsToRetirement)
            Dim finalFinancialGoal = netAssetsRequired + fvHome
            _output.TotalNetAssetsRequired = finalFinancialGoal

            Dim yearlyGoalAmount As Double = (finalFinancialGoal - initialFinancialGoal) / _output.YearsToRetirement

            Dim dataList As New List(Of FinancialGoalData)()
            Dim cumulativeFinancialGoal As Double = initialFinancialGoal + yearlyGoalAmount

            For i As Integer = 1 To _output.YearsToRetirement
                Dim financialGoal As Double = cumulativeFinancialGoal
                Dim data As New FinancialGoalData()
                data.YearsToRetire = i
                data.CumulativeFinancialGoal = financialGoal
                dataList.Add(data)
                cumulativeFinancialGoal = cumulativeFinancialGoal + yearlyGoalAmount
            Next

            _output.FinancialGoalList = dataList
        End Sub

#End Region

#Region "Table Generation"

        Public Function GetKiwiSaverTable(ByVal _salaryNow As Double, ByRef _output As WealthTrackerOutputModel) As List(Of KiwiSaverData)
            Dim retval As New List(Of KiwiSaverData)()
            Dim cumulativeCombinedSalary As Double = _salaryNow
            Dim clientContribution As Double = cumulativeCombinedSalary * _output.KiwiSaverEmployeeContribution
            Dim employerContribution As Double = (cumulativeCombinedSalary * _output.KiwiSaverEmployerContribution) - ((cumulativeCombinedSalary * _output.KiwiSaverEmployerContribution) * GetESCT(cumulativeCombinedSalary))
            Dim cumulativeKiwiSaver As Double = (_output.KiwiSaverAmount + clientContribution + employerContribution) + ((_output.KiwiSaverAmount + clientContribution + employerContribution) * _output.KiwiSaverAverageInvestmentRate)

            For i As Integer = 1 To _output.YearsToRetirement
                Dim data As KiwiSaverData = New KiwiSaverData()
                data.YearsToRetire = i
                data.CombinedSalary = cumulativeCombinedSalary
                cumulativeCombinedSalary += cumulativeCombinedSalary * _output.InflationRate
                data.CumulativeKiwiSaver = cumulativeKiwiSaver

                clientContribution = cumulativeCombinedSalary * _output.KiwiSaverEmployeeContribution
                employerContribution = (cumulativeCombinedSalary * _output.KiwiSaverEmployerContribution) - ((cumulativeCombinedSalary * _output.KiwiSaverEmployerContribution) * GetESCT(cumulativeCombinedSalary))
                cumulativeKiwiSaver = (cumulativeKiwiSaver + clientContribution + employerContribution) + ((cumulativeKiwiSaver + clientContribution + employerContribution) * _output.KiwiSaverAverageInvestmentRate)
                retval.Add(data)
            Next

            Return retval
        End Function

        Public Function GetCashSavingsTable(ByRef _output As WealthTrackerOutputModel) As List(Of CashSavingsData)
            Dim retval As New List(Of CashSavingsData)()
            Dim cumulativeCashSavings As Double = (_output.CurrentCashSavings + _output.AnnualCashSavingsContributions) + ((_output.CurrentCashSavings + _output.AnnualCashSavingsContributions) * _output.CashSavingsInterestRate)

            For i As Integer = 1 To _output.YearsToRetirement
                Dim data As New CashSavingsData()
                data.YearsToRetire = i
                data.CumulativeCashSavings = cumulativeCashSavings
                retval.Add(data)
                cumulativeCashSavings = (cumulativeCashSavings + _output.AnnualCashSavingsContributions) + ((cumulativeCashSavings + _output.AnnualCashSavingsContributions) * _output.CashSavingsInterestRate)
            Next

            Return retval
        End Function

        Public Function GetShareBusinessTable(ByRef _output As WealthTrackerOutputModel) As List(Of ShareBusinessData)
            Dim retval As New List(Of ShareBusinessData)()
            Dim cumulativeShareBusiness As Double = (_output.CurrentShareBusiness)

            For i As Integer = 1 To _output.YearsToRetirement
                Dim data As New ShareBusinessData()
                data.YearsToRetire = i
                data.CumulativeShareBusiness = cumulativeShareBusiness
                retval.Add(data)
                cumulativeShareBusiness = (cumulativeShareBusiness) + (cumulativeShareBusiness * _output.ShareBusinessGrowthRate)
            Next

            Return retval
        End Function

        Public Function GetPropertyTable(ByVal _presentValue As Double, ByVal _annualAppreciationRate As Double, ByVal _propertyPurchaseYear As Integer, ByVal _debtAmount As Double, ByVal _interestRate As Double, ByVal _repaymentYears As Integer, ByVal _repaymentStartYear As Integer, ByVal _numberOfYears As Integer) As List(Of PropertyData)
            Dim retval As New List(Of PropertyData)()

            Dim dlist As New List(Of MortgageData)
            dlist = GenerateMortgageTable(_debtAmount, _interestRate, _repaymentYears)
            Dim mortgateCounter As Integer = 0
            Dim cumulativeGrossValue As Double = _presentValue
            Dim yearlyPayment As Double = 0
            If (dlist.Count() > 0) Then
                yearlyPayment = dlist.Item(0).Payment
            End If

            For i As Integer = 1 To _numberOfYears

                Dim mdata As New PropertyData
                mdata.YearsToRetire = i
                mdata.YearlyPayment = yearlyPayment
                Dim resultGrossValue As Double = cumulativeGrossValue + (cumulativeGrossValue * _annualAppreciationRate)
                Dim mortgage As Double = _presentValue

                If (i >= _propertyPurchaseYear) Then
                    mdata.GrossValue = resultGrossValue
                    cumulativeGrossValue = resultGrossValue
                    mdata.Mortgage = mortgage

                    If (i >= _repaymentStartYear + 1) Then
                        mortgateCounter = mortgateCounter + 1
                        Dim mMortgageData As MortgageData = dlist.Where(Function(x) x.RepaymentsYear = mortgateCounter).FirstOrDefault()
                        If (Not (mMortgageData Is Nothing)) Then
                            mortgage = mMortgageData.EndingBalance
                        Else
                            mortgage = 0
                        End If
                        mdata.Mortgage = mortgage

                    End If

                    mdata.NetPropertyWealth = cumulativeGrossValue - mortgage
                End If

                retval.Add(mdata)
            Next

            Return retval

        End Function

        Public Function GenerateMortgageTable(ByVal _presentValue As Double, ByVal _interestRate As Double, ByVal _numberOfYears As Integer) As List(Of MortgageData)
            Dim retval As New List(Of MortgageData)()
            Dim yearlyMortgage As Double = GetYearlyPayment(_presentValue, _interestRate, _numberOfYears)
            Dim startingBalance As Double = _presentValue

            For i As Integer = 1 To _numberOfYears
                Dim mdata As New MortgageData
                mdata.RepaymentsYear = i
                mdata.StartingBalance = startingBalance
                mdata.Payment = yearlyMortgage
                Dim interest As Double = startingBalance * _interestRate
                mdata.Interest = interest
                Dim principal As Double = yearlyMortgage - interest
                mdata.Principal = principal
                Dim endBalance As Double = startingBalance - principal
                If endBalance < 1 Then
                    endBalance = 0
                End If
                mdata.EndingBalance = endBalance
                retval.Add(mdata)
                startingBalance = endBalance
            Next

            Return retval
        End Function

        Public Function GetInheritanceHomeTable(ByRef _output As WealthTrackerOutputModel) As List(Of InheritanceInvestmentData)
            Dim retval As New List(Of InheritanceInvestmentData)()
            Dim cumulativeInheritanceInvestment As Double = 0

            For i As Integer = 1 To _output.YearsToRetirement
                Dim data As New InheritanceInvestmentData()
                data.YearsToRetire = i

                If (_output.ExpectedInheritance.TargetYear = i) Then
                    cumulativeInheritanceInvestment = cumulativeInheritanceInvestment + _output.ExpectedInheritance.Amount
                End If
                If (_output.MaturingInvestment1.TargetYear = i) Then
                    cumulativeInheritanceInvestment = cumulativeInheritanceInvestment + _output.MaturingInvestment1.Amount
                End If
                If (_output.MaturingInvestment2.TargetYear = i) Then
                    cumulativeInheritanceInvestment = cumulativeInheritanceInvestment + _output.MaturingInvestment2.Amount
                End If
                If (_output.MaturingInvestment3.TargetYear = i) Then
                    cumulativeInheritanceInvestment = cumulativeInheritanceInvestment + _output.MaturingInvestment3.Amount
                End If
                If (_output.MaturingInvestment4.TargetYear = i) Then
                    cumulativeInheritanceInvestment = cumulativeInheritanceInvestment + _output.MaturingInvestment4.Amount
                End If
                data.CumulativeInheritanceInvestment = cumulativeInheritanceInvestment
                retval.Add(data)
            Next

            Return retval
        End Function

#End Region

#Region "Miscellaneous"

        Public Function GetFutureValue(ByVal _presentValue As Double, ByVal _interestRate As Double, ByVal _numberOfYears As Integer) As Double
            Dim retval As Double = _presentValue
            Dim finalRate As Double = 1 + _interestRate

            For i As Integer = 1 To _numberOfYears - 1
                finalRate = finalRate * (1 + _interestRate)
            Next

            retval = _presentValue * finalRate
            Return retval
        End Function

        Public Function GetYearlyPayment(ByVal _presentValue As Double, ByVal _interestRate As Double, ByVal _numberOfYears As Integer) As Double
            Dim retval As Double = _presentValue

            retval = _presentValue / (((Math.Pow((1 + _interestRate), _numberOfYears)) - 1) / (_interestRate * (Math.Pow((1 + _interestRate), _numberOfYears))))

            Return retval
        End Function

        Private Function GetAge(ByVal birthdate As DateTime) As Integer
            Dim today = DateTime.Today
            Dim age = today.Year - birthdate.Year
            If birthdate.Date > today.AddYears(-age) Then age -= 1
            Return age
        End Function

        Private Function GetESCT(ByVal _salary As Double) As Double
            If (_salary >= 84001) Then Return 0.33
            If ((_salary >= 57601) And (_salary < 84001)) Then Return 0.3
            If ((_salary >= 16801) And (_salary < 57601)) Then Return 0.175
            Return 0.105
        End Function
#End Region

    End Class
End Namespace
