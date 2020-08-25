Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports WealthTracker.Models

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()>
<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class dataservice
    Inherits System.Web.Services.WebService

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetCashSavings() As List(Of CashSavingsData)

        Dim retval As New List(Of CashSavingsData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.CashSavingsList Is Nothing) Then
                retval = output.CashSavingsList
            End If
        End If

        Return retval

    End Function



    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetKiwiSaverClient() As List(Of KiwiSaverData)

        Dim retval As New List(Of KiwiSaverData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.KiwiSaverListClient Is Nothing) Then
                retval = output.KiwiSaverListClient
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetKiwiSaverSpouse() As List(Of KiwiSaverData)

        Dim retval As New List(Of KiwiSaverData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.KiwiSaverListSpouse Is Nothing) Then
                retval = output.KiwiSaverListSpouse
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetShareBusiness() As List(Of ShareBusinessData)

        Dim retval As New List(Of ShareBusinessData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.ShareBusinessList Is Nothing) Then
                retval = output.ShareBusinessList
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetHome() As List(Of PropertyData)

        Dim retval As New List(Of PropertyData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.HomeList Is Nothing) Then
                retval = output.HomeList
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetInvestmentInheritance() As List(Of InheritanceInvestmentData)

        Dim retval As New List(Of InheritanceInvestmentData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.InheritanceInvestmentList Is Nothing) Then
                retval = output.InheritanceInvestmentList
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetCurrentDebt() As List(Of CurrentDebtData)

        Dim retval As New List(Of CurrentDebtData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.CurrentDebtList Is Nothing) Then
                retval = output.CurrentDebtList
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetCurrentAssets() As List(Of CurrentAssetsData)

        Dim retval As New List(Of CurrentAssetsData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.CurrentAssetsList Is Nothing) Then
                retval = output.CurrentAssetsList
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetInvestmentProperty1() As List(Of PropertyData)

        Dim retval As New List(Of PropertyData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.InvestmentProperty1List Is Nothing) Then
                retval = output.InvestmentProperty1List
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetInvestmentProperty2() As List(Of PropertyData)

        Dim retval As New List(Of PropertyData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.InvestmentProperty2List Is Nothing) Then
                retval = output.InvestmentProperty2List
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetInvestmentProperty3() As List(Of PropertyData)

        Dim retval As New List(Of PropertyData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.InvestmentProperty3List Is Nothing) Then
                retval = output.InvestmentProperty3List
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetInvestmentProperties() As List(Of InvestmentPropertyData)

        Dim retval As New List(Of InvestmentPropertyData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.InvestmentPropertyList Is Nothing) Then
                retval = output.InvestmentPropertyList
            End If
        End If

        Return retval

    End Function

    <Script.Services.ScriptMethod(ResponseFormat:=System.Web.Script.Services.ResponseFormat.Json)>
    <WebMethod(EnableSession:=True)>
    Public Function GetFinancialGoal() As List(Of FinancialGoalData)

        Dim retval As New List(Of FinancialGoalData)

        Dim output As New WealthTrackerOutputModel
        If Not (HttpContext.Current.Session.Item("WEALTHTRACKER_CURRENTOBJECT") Is Nothing) Then
            output = Session.Item("WEALTHTRACKER_CURRENTOBJECT")
            If Not (output.FinancialGoalList Is Nothing) Then
                retval = output.FinancialGoalList
            End If
        End If

        Return retval

    End Function

End Class