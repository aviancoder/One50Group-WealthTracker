﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="template.aspx.vb" Inherits="template" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>One50Group Wealth Tracker</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="~/css/site.css" />
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
            <div class="container">
                <a class="navbar-brand" href="index.aspx">Wealth Tracker</a>
                <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="basicdetails.aspx">Basic Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="weathtracker.aspx">Wealth Tracker</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="privacry.aspx">Privacy</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="container">
        <main role="main" class="pb-3">
            <form id="formMain" runat="server">
                <div class="row">
                    <asp:TextBox ID="test" runat="server" Text="" class="form-control  text-right one50group-formattednumber" type="text"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body text-right">
                                <asp:Button ID="btnUpdateChart" runat="server" Text="Update Graph" class="form-control ui-button-text btn-success" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Start divInvestmentProperty -->
                <div class="row">
                    <div class="col-md-12 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Investment Properties</h4>
                                <div class="row" id="divInvestmentProperty">
                                    <div class="col-md-6 mb-4" id="divCardIP1" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP1" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty1">Property Name</label><asp:TextBox ID="InvestmentProperty1" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(1)" type="button" class="btn btn-sm p-1" id="btnAddIP1" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(1)" type="button" class="btn btn-sm p-1" id="btnSaveIP1" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP1" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName1" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(1)" type="button" class="btn btn-sm p-1" id="btnEditIP1" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(1)" type="button" class="btn btn-sm p-1" id="btnRemoveIP1" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP1" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear1" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue1" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt1" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear1" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt1" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments1" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement1" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP2" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP2" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty2">Property Name</label><asp:TextBox ID="InvestmentProperty2" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(2)" type="button" class="btn btn-sm p-1" id="btnAddIP2" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(2)" type="button" class="btn btn-sm p-1" id="btnSaveIP2" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP2" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName2" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(2)" type="button" class="btn btn-sm p-1" id="btnEditIP2" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(2)" type="button" class="btn btn-sm p-1" id="btnRemoveIP2" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP2" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear2" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue2" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt2" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear2" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt2" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments2" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement2" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP3" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP3" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty3">Property Name</label><asp:TextBox ID="InvestmentProperty3" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(3)" type="button" class="btn btn-sm p-1" id="btnAddIP3" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(3)" type="button" class="btn btn-sm p-1" id="btnSaveIP3" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP3" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName3" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(3)" type="button" class="btn btn-sm p-1" id="btnEditIP3" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(3)" type="button" class="btn btn-sm p-1" id="btnRemoveIP3" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP3" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear3" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue3" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt3" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear3" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt3" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments3" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement3" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP4" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP4" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty4">Property Name</label><asp:TextBox ID="InvestmentProperty4" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(4)" type="button" class="btn btn-sm p-1" id="btnAddIP4" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(4)" type="button" class="btn btn-sm p-1" id="btnSaveIP4" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP4" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName4" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(4)" type="button" class="btn btn-sm p-1" id="btnEditIP4" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(4)" type="button" class="btn btn-sm p-1" id="btnRemoveIP4" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP4" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear4" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue4" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt4" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear4" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt4" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments4" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement4" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP5" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP5" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty5">Property Name</label><asp:TextBox ID="InvestmentProperty5" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(5)" type="button" class="btn btn-sm p-1" id="btnAddIP5" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(5)" type="button" class="btn btn-sm p-1" id="btnSaveIP5" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP5" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName5" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(5)" type="button" class="btn btn-sm p-1" id="btnEditIP5" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(5)" type="button" class="btn btn-sm p-1" id="btnRemoveIP5" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP5" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear5" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue5" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt5" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear5" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt5" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments5" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement5" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP6" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP6" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty6">Property Name</label><asp:TextBox ID="InvestmentProperty6" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(6)" type="button" class="btn btn-sm p-1" id="btnAddIP6" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(6)" type="button" class="btn btn-sm p-1" id="btnSaveIP6" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP6" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName6" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(6)" type="button" class="btn btn-sm p-1" id="btnEditIP6" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(6)" type="button" class="btn btn-sm p-1" id="btnRemoveIP6" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP6" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear6" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue6" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt6" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear6" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt6" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments6" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement6" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP7" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP7" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty7">Property Name</label><asp:TextBox ID="InvestmentProperty7" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(7)" type="button" class="btn btn-sm p-1" id="btnAddIP7" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(7)" type="button" class="btn btn-sm p-1" id="btnSaveIP7" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP7" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName7" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(7)" type="button" class="btn btn-sm p-1" id="btnEditIP7" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(7)" type="button" class="btn btn-sm p-1" id="btnRemoveIP7" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP7" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear7" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue7" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt7" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear7" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt7" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments7" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement7" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP8" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP8" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty8">Property Name</label><asp:TextBox ID="InvestmentProperty8" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(8)" type="button" class="btn btn-sm p-1" id="btnAddIP8" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(8)" type="button" class="btn btn-sm p-1" id="btnSaveIP8" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP8" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName8" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(8)" type="button" class="btn btn-sm p-1" id="btnEditIP8" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(8)" type="button" class="btn btn-sm p-1" id="btnRemoveIP8" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP8" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear8" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue8" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt8" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear8" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt8" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments8" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement8" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP9" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP9" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty9">Property Name</label><asp:TextBox ID="InvestmentProperty9" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(9)" type="button" class="btn btn-sm p-1" id="btnAddIP9" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(9)" type="button" class="btn btn-sm p-1" id="btnSaveIP9" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP9" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName9" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(9)" type="button" class="btn btn-sm p-1" id="btnEditIP9" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(9)" type="button" class="btn btn-sm p-1" id="btnRemoveIP9" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP9" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear9" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue9" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt9" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear9" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt9" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments9" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement9" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP10" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP10" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty10">Property Name</label><asp:TextBox ID="InvestmentProperty10" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(10)" type="button" class="btn btn-sm p-1" id="btnAddIP10" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(10)" type="button" class="btn btn-sm p-1" id="btnSaveIP10" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP10" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName10" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(10)" type="button" class="btn btn-sm p-1" id="btnEditIP10" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(10)" type="button" class="btn btn-sm p-1" id="btnRemoveIP10" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP10" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear10" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue10" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt10" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear10" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt10" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments10" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement10" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP11" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP11" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty11">Property Name</label><asp:TextBox ID="InvestmentProperty11" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(11)" type="button" class="btn btn-sm p-1" id="btnAddIP11" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(11)" type="button" class="btn btn-sm p-1" id="btnSaveIP11" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP11" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName11" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(11)" type="button" class="btn btn-sm p-1" id="btnEditIP11" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(11)" type="button" class="btn btn-sm p-1" id="btnRemoveIP11" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP11" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear11" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue11" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt11" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear11" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt11" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments11" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement11" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP12" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP12" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty12">Property Name</label><asp:TextBox ID="InvestmentProperty12" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(12)" type="button" class="btn btn-sm p-1" id="btnAddIP12" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(12)" type="button" class="btn btn-sm p-1" id="btnSaveIP12" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP12" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName12" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(12)" type="button" class="btn btn-sm p-1" id="btnEditIP12" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(12)" type="button" class="btn btn-sm p-1" id="btnRemoveIP12" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP12" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear12" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue12" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt12" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear12" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt12" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments12" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement12" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP13" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP13" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty13">Property Name</label><asp:TextBox ID="InvestmentProperty13" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(13)" type="button" class="btn btn-sm p-1" id="btnAddIP13" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(13)" type="button" class="btn btn-sm p-1" id="btnSaveIP13" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP13" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName13" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(13)" type="button" class="btn btn-sm p-1" id="btnEditIP13" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(13)" type="button" class="btn btn-sm p-1" id="btnRemoveIP13" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP13" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear13" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue13" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt13" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear13" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt13" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments13" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement13" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP14" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP14" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty14">Property Name</label><asp:TextBox ID="InvestmentProperty14" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(14)" type="button" class="btn btn-sm p-1" id="btnAddIP14" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(14)" type="button" class="btn btn-sm p-1" id="btnSaveIP14" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP14" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName14" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(14)" type="button" class="btn btn-sm p-1" id="btnEditIP14" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(14)" type="button" class="btn btn-sm p-1" id="btnRemoveIP14" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP14" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear14" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue14" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt14" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear14" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt14" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments14" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement14" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP15" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP15" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty15">Property Name</label><asp:TextBox ID="InvestmentProperty15" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(15)" type="button" class="btn btn-sm p-1" id="btnAddIP15" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(15)" type="button" class="btn btn-sm p-1" id="btnSaveIP15" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP15" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName15" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(15)" type="button" class="btn btn-sm p-1" id="btnEditIP15" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(15)" type="button" class="btn btn-sm p-1" id="btnRemoveIP15" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP15" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear15" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue15" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt15" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear15" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt15" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments15" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement15" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP16" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP16" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty16">Property Name</label><asp:TextBox ID="InvestmentProperty16" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(16)" type="button" class="btn btn-sm p-1" id="btnAddIP16" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(16)" type="button" class="btn btn-sm p-1" id="btnSaveIP16" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP16" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName16" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(16)" type="button" class="btn btn-sm p-1" id="btnEditIP16" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(16)" type="button" class="btn btn-sm p-1" id="btnRemoveIP16" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP16" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear16" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue16" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt16" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear16" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt16" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments16" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement16" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP17" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP17" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty17">Property Name</label><asp:TextBox ID="InvestmentProperty17" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(17)" type="button" class="btn btn-sm p-1" id="btnAddIP17" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(17)" type="button" class="btn btn-sm p-1" id="btnSaveIP17" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP17" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName17" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(17)" type="button" class="btn btn-sm p-1" id="btnEditIP17" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(17)" type="button" class="btn btn-sm p-1" id="btnRemoveIP17" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP17" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear17" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue17" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt17" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear17" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt17" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments17" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement17" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP18" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP18" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty18">Property Name</label><asp:TextBox ID="InvestmentProperty18" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(18)" type="button" class="btn btn-sm p-1" id="btnAddIP18" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(18)" type="button" class="btn btn-sm p-1" id="btnSaveIP18" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP18" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName18" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(18)" type="button" class="btn btn-sm p-1" id="btnEditIP18" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(18)" type="button" class="btn btn-sm p-1" id="btnRemoveIP18" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP18" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear18" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue18" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt18" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear18" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt18" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments18" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement18" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP19" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP19" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty19">Property Name</label><asp:TextBox ID="InvestmentProperty19" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(19)" type="button" class="btn btn-sm p-1" id="btnAddIP19" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(19)" type="button" class="btn btn-sm p-1" id="btnSaveIP19" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP19" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName19" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(19)" type="button" class="btn btn-sm p-1" id="btnEditIP19" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(19)" type="button" class="btn btn-sm p-1" id="btnRemoveIP19" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP19" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear19" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue19" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt19" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear19" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt19" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments19" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement19" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4" id="divCardIP20" style="display: none;">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="divNewIP20" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <label for="InvestmentProperty20">Property Name</label><asp:TextBox ID="InvestmentProperty20" runat="server" class="form-control form-control-sm" Style="width 240px !important;"></asp:TextBox>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="addsaveProperty(20)" type="button" class="btn btn-sm p-1" id="btnAddIP20" style="display: none;"><span class="fa fa-plus-circle" style="color: #28a745; font-size: 2rem;" title="add property"></span></button>
                                                            <button onclick="addsaveProperty(20)" type="button" class="btn btn-sm p-1" id="btnSaveIP20" style="display: none;"><span class="fa fa-check-circle" style="color: #1b6ec2; font-size: 2rem;" title="save property name"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divUpdateIP20" style="display: none;">
                                                    <div class="d-flex">
                                                        <div class="mr-auto p-2">
                                                            <asp:Label ID="InvestmentPropertyName20" runat="server" class="border-0 h5 text-info text-left"></asp:Label>
                                                        </div>
                                                        <div class="p-2">
                                                            <button onclick="editProperty(20)" type="button" class="btn btn-sm p-1" id="btnEditIP20" style="display: none;"><span class="fa fa-pencil" style="color: #28a745; font-size: 2rem;" title="edit property name"></span></button>
                                                            <button onclick="removeProperty(20)" type="button" class="btn btn-sm p-1" id="btnRemoveIP20" style="display: none;"><span class="fa fa-trash" style="color: #dc3545; font-size: 2rem;" title="remove property"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divTableIP20" style="display: none;">
                                                    <table class="table table-borderless">
                                                        <tbody>
                                                            <tr>
                                                                <td><span>Purchase Year</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyPurchaseYear20" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Value ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyValue20" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Debt ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyDebt20" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>P&I Repayments Begin Year ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyRepaymentsBeginYear20" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Years To Repay Debt</span></td>
                                                                <td class="text-right">
                                                                    <asp:TextBox ID="InvestmentPropertyYearsToRepayDebt20" runat="server" class="form-control form-control-sm text-right one50group-formattednumber"></asp:TextBox></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span>Monthly Repayments</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyMonthlyRepayments20" class="text-right"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                                                <td class="text-right">
                                                                    <asp:Label runat="server" ID="InvestmentPropertyNetHomeValueAtRetirement20" class="text-right h4"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End divInvestmentProperty -->

            </form>
        </main>
    </div>

    <footer class="border-top footer text-muted">
        <div class="container">
            &copy; 2020 - One50Group Wealth Tracker - <a href="privacry.aspx">Privacy</a>
        </div>
    </footer>
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.src.js"></script>
    <script src="/js/json2.js"></script>
    <script src="/js/utilities.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            initializeInvestmentProperties();

        });

        function initializeInvestmentProperties() {

            for (i = 1; i <= 20; i++) {

                var noValue = true;
                var elemPropertyName = $("#InvestmentPropertyName" + i)

                if (elemPropertyName) {
                    var propertyName = elemPropertyName.text();
                    if (propertyName.length > 0)
                        noValue = false;
                }
                if (noValue) {
                    // set this node as ready to add and hide succeeding elements
                    togglePropertyToReadyToAdd(i);
                    hideAllSucceedingProperties(i);
                    return;
                }
                else {
                    togglePropertyWithValue(i);
                }
            }
        }

        function toggleInvestmentProperties(idx) {

            for (i = idx; i <= 20; i++) {

                var noValue = true;
                var elemPropertyName = $("#InvestmentPropertyName" + i)

                if (elemPropertyName) {
                    var propertyName = elemPropertyName.text();
                    if (propertyName.length > 0)
                        noValue = false;
                }
                if (noValue) {
                    // set this node as ready to add and hide succeeding elements
                    togglePropertyToReadyToAdd(i);
                    hideAllSucceedingProperties(i);
                    return;
                }
                else {
                    togglePropertyWithValue(i);
                }
            }
        }

        function transferValuesToPredecessor(idx) {

            for (i = idx; i <= 19; i++) {

                var nextPropertyName = $("#InvestmentPropertyName" + (i + 1)).text();
                if (nextPropertyName.length > 0) {
                    // perform transfer
                    $("#InvestmentPropertyName" + i).text($("#InvestmentPropertyName" + (i + 1)).text());
                    $("#InvestmentPropertyName" + (i + 1)).text("");
                    console.log($("#InvestmentPropertyPurchaseYear" + (i + 1)).val());
                    $("#InvestmentPropertyPurchaseYear" + i).val($("#InvestmentPropertyPurchaseYear" + (i + 1)).val());
                    $("#InvestmentPropertyPurchaseYear" + (i + 1)).val("");
                    $("#InvestmentPropertyRepaymentsBeginYear" + i).val($("#InvestmentPropertyRepaymentsBeginYear" + (i + 1)).val());
                    $("#InvestmentPropertyRepaymentsBeginYear" + (i + 1)).val("");
                    $("#InvestmentPropertyValue" + i).val($("#InvestmentPropertyValue" + (i + 1)).val());
                    $("#InvestmentPropertyValue" + (i + 1)).val("");
                    $("#InvestmentPropertyDebt" + i).val($("#InvestmentPropertyDebt" + (i + 1)).val());
                    $("#InvestmentPropertyDebt" + (i + 1)).val("");
                    $("#InvestmentPropertyYearsToRepayDebt" + i).val($("#InvestmentPropertyYearsToRepayDebt" + (i + 1)).val());
                    $("#InvestmentPropertyYearsToRepayDebt" + (i + 1)).val("");
                    $("#InvestmentPropertyMonthlyRepayments" + i).text($("#InvestmentPropertyMonthlyRepayments" + (i + 1)).text());
                    $("#InvestmentPropertyMonthlyRepayments" + (i + 1)).text("");
                    $("#InvestmentPropertyNetHomeValueAtRetirement" + i).text($("#InvestmentPropertyNetHomeValueAtRetirement" + (i + 1)).text());
                    $("#InvestmentPropertyNetHomeValueAtRetirement" + (i + 1)).text("");
                }
                else {
                    return;
                }
            }
        }

        function addsaveProperty(idx) {
            if ($("#InvestmentProperty" + idx).val().trim().length > 0) {
                $("#InvestmentPropertyName" + idx).text($("#InvestmentProperty" + idx).val().trim());
                togglePropertyWithValue(idx);
            }
        }

        function removeProperty(idx) {
            $("#InvestmentPropertyName" + idx).text("");
            transferValuesToPredecessor(idx);
            initializeInvestmentProperties();
        }

        function editProperty(idx) {
            $("#InvestmentProperty" + idx).val($("#InvestmentPropertyName" + idx).text());
            $("#divNewIP" + idx).show();
            $("#btnAddIP" + idx).hide();
            $("#btnSaveIP" + idx).show();
            $("#divUpdateIP" + idx).hide();
        }

        function hideAllSucceedingProperties(idx) {

            for (i = idx + 1; i <= 20; i++) {
                $("#divCardIP" + i).hide();
            }
        }

        function togglePropertyWithValue(idx) {
            $("#divCardIP" + idx).show();
            $("#divNewIP" + idx).hide();
            $("#divUpdateIP" + idx).show();
            $("#btnEditIP" + idx).show();
            $("#btnRemoveIP" + idx).show();
            $("#divTableIP" + idx).show();
        }

        function togglePropertyToReadyToAdd(idx) {
            $("#divCardIP" + idx).show();
            $("#divNewIP" + idx).show();
            $("#btnAddIP" + idx).show();
            $("#btnSaveIP" + idx).hide();
            $("#divUpdateIP" + idx).hide();
            $("#divTableIP" + idx).hide();
        }
    </script>
</body>
</html>
