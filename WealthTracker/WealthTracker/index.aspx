<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>One50Group Wealth Tracker</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
    <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="~/css/site.css" />
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
            <div class="container">
                <a class="navbar-brand" href="index.aspx">Wealth Tracker</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="index.aspx">Basic Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="wealthtracker.aspx">Wealth Tracker</a>
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
            <form id="formMain" runat="server" action="wealthtracker.aspx">
                <table class="table table-borderless" style="background-color: #fff;">
                    <thead class="thead-light">
                        <tr>
                            <th colspan="3">Personal Details</th>
                        </tr>
                    </thead>
                    <tr>
                        <th></th>
                        <th>Client</th>
                        <th>Spouse</th>
                    </tr>
                    <tr>
                        <td><span>Name</span></td>
                        <td>
                            <asp:TextBox ID="ClientName" runat="server" Text="Arnel Aves" class="form-control"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseName" runat="server" Text="Joarren Aves" class="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Date of Birth</span></td>
                        <td>
                            <asp:TextBox ID="ClientDateOfBirth" runat="server" Text="1970-01-01" class="form-control  text-right" type="date"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseDateOfBirth" runat="server" Text="1975-02-02" class="form-control  text-right" type="date"></asp:TextBox></td>
                    </tr>
                    <thead class="thead-light">
                        <tr>
                            <th colspan="3">Current Assets</th>
                        </tr>
                    </thead>
                    <tr>
                        <th></th>
                        <th>Client</th>
                        <th>Spouse</th>
                    </tr>
                    <tr>
                        <td><span>Gross Income</span></td>
                        <td>
                            <asp:TextBox ID="ClientGrossIncome" runat="server" Text="80,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseGrossIncome" runat="server" Text="50,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Cash Savings</span></td>
                        <td>
                            <asp:TextBox ID="ClientCashSavings" runat="server" Text="200,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseCashSavings" runat="server" Text="30,0000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Kiwi Saver</span></td>
                        <td>
                            <asp:TextBox ID="ClientKiwiSaver" runat="server" Text="20,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseKiwiSaver" runat="server" Text="20,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Share / Investments</span></td>
                        <td>
                            <asp:TextBox ID="ClientShareInvestments" runat="server" Text="25,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseShareInvestments" runat="server" Text="25,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Property Value</span></td>
                        <td>
                            <asp:TextBox ID="ClientPropertyValue" runat="server" Text="1,000,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><span>Mortgage</span></td>
                        <td>
                            <asp:TextBox ID="ClientMortgage" runat="server" Text="600,000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td></td>
                    </tr>
                    <thead class="thead-light">
                        <tr>
                            <th colspan="3">Current Debts</th>
                        </tr>
                    </thead>
                    <tr>
                        <th></th>
                        <th>Client</th>
                        <th>Spouse</th>
                    </tr>
                    <tr>
                        <td><span>Credit Cards</span></td>
                        <td>
                            <asp:TextBox ID="ClientDebtCreditCard" runat="server" Text="80000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseDebtCreditCard" runat="server" Text="50000" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="DebtCreditCardRate" runat="server" Text="4" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                     <tr>
                        <td><span>Hire Purchase</span></td>
                        <td>
                            <asp:TextBox ID="ClientDebtHire" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseDebtHire" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="DebtHireRate" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Personal Loans</span></td>
                        <td>
                            <asp:TextBox ID="ClientDebtPersonal" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseDebtPersonal" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="DebtPersonalRate" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Vehicle Finance</span></td>
                        <td>
                            <asp:TextBox ID="ClientDebtVehicle" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseDebtVehicle" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="DebtVehicleRate" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><span>Other</span></td>
                        <td>
                            <asp:TextBox ID="ClientDebtOther" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="SpouseDebtOther" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="DebtHOtherRate" runat="server" Text="0" class="form-control  text-right one50group-formattednumber"></asp:TextBox></td>
                    </tr>
                    <thead class="thead-light">
                        <tr>
                            <th colspan="3">Click the button below to proceed</th>
                        </tr>
                    </thead>
                    <tr>
                        <td colspan="1" class="text-right"></td>
                        <td colspan="1" class="text-right"></td>
                        <td colspan="1" class="text-right">
                            <input class="form-control ui-button-text" type="submit" name="BtnSubmit" title="Submit" /></td>
                    </tr>
                </table>
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
</body>
</html>
