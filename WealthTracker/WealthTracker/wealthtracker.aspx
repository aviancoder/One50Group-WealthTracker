<%@ Page EnableEventValidation="false" Language="VB" AutoEventWireup="false" CodeFile="wealthtracker.aspx.vb" Inherits="_wealthtracker" %>

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
                            <a class="nav-link text-dark" href="privacy.aspx">Privacy</a>
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
                    <div class="col-md-12 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <div id="ChartContainer"></div>
                            </div>
                        </div>
                    </div>
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
                <div class="row">
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Income</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Annual income required to retire now ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="TotalAnnualIncome" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Years to Retirement</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="YearsToRetirement" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span>Inflation Rate (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="InflationRate" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span>Annual Income to Retirement (Inflation Adjusted)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="AnnualIncomeForRetirement" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Less Pension (Inflation Adjusted at 2%)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="LessPension" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">Total Annual Income for Retirement ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="TotalAnnualIncomeForRetirement" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Cash</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Current Cash Savings ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="CurrentCashSavings" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Annual Cash Savings Contribution ($)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="AnnualCashSavingsContributions" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span>Interest Rate (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="CashSavingsInterestRate" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">Cash Savings at Retirement ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="TotalCashSavingsAtRetirement" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Kiwi Saver</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Current KiwiSaver ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="KiwiSaverAmount" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>KiwiSaver Contributions (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="KiwiSaverEmployeeContribution" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span>Kiwisaver Growth (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="KiwiSaverAverageInvestmentRate" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">KiwiSaver Total at Retirement ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="KiwiSaverTotalAtRetirement" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Share / Business</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Current Share / Business ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="CurrentShareBusiness" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Share / Business Growth Rate (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="ShareBusinessGrowthRate" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">Shares/Business Total at Retirement ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="TotalShareBusinessAtRetirement" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Property</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Current Property ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="HomeProperty" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Current Mortgage ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="HomeMortgage" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Current Investment Rate (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="HomeInterestRate" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span>Annual Appreciation Rate (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="HomeAnnualAppreciationRate" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span>Years to Repay Mortgage</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="HomeYearsToRepayMortgage" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="NetHomeValueAtRetirement" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Assets</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Net Assets Excluding Home</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="NetAssetsRequired" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Return on Investment (%)</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="NetAssetsReturnOnInvestment" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">Total Net Assets Required (Including Home) ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="TotalNetAssetsRequired" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Inheritance / Maturing Investment</h4>
                                <table class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="text-center">Year</th>
                                            <th class="text-center">Amount ($)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><span>Expected Inheritance</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="ExpectedInheritanceYear" runat="server" class="form-control form-control-sm text-right" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="ExpectedInheritanceAmount" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Maturing Investment 1</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment1Year" runat="server" class="form-control form-control-sm text-right" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment1Amount" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Maturing Investment 2</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment2Year" runat="server" class="form-control form-control-sm text-right" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment2Amount" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Maturing Investment 3</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment3Year" runat="server" class="form-control form-control-sm text-right" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment3Amount" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Maturing Investment 4</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment4Year" runat="server" class="form-control form-control-sm text-right" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="MaturingInvestment4Amount" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Debt</h4>
                                <table class="table table-borderless">
                                    <tr>
                                        <td><span>Current Debt</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="CurrentDebt" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Max Interest (%)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="CurrentDebtMaxInterestRate" class="text-right"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><span>Years to Repay Debt</span></td>
                                        <td class="text-right">
                                            <asp:TextBox ID="CurrentDebtYearsToRepay" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td><span class="text-success">Monthly Repayments ($)</span></td>
                                        <td class="text-right">
                                            <asp:Label runat="server" ID="CurrentDebtMothlyRepayment" class="text-right h4"></asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-4 pr-md-1">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title text-info">Investment Properties</h4>
                                <table class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="text-center">First</th>
                                            <th class="text-center">Second</th>
                                            <th class="text-center">Third</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><span>Purchase Year</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty1PurchaseYear" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty2PurchaseYear" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty3PurchaseYear" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Value ($)</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty1Value" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty2Value" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty3Value" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Debt ($)</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty1Debt" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty2Debt" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty3Debt" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>P&I Repayments Begin Year ($)</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty1RepaymentsBeginYear" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty2RepaymentsBeginYear" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty3RepaymentsBeginYear" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Years to Repay Debt</span></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty1YearsToRepayDebt" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty2YearsToRepayDebt" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                            <td class="text-right">
                                                <asp:TextBox ID="InvestmentProperty3YearsToRepayDebt" runat="server" class="form-control form-control-sm text-right" step=".01" type="number"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td><span>Monthly Repayments</span></td>
                                            <td class="text-right">
                                                <asp:Label runat="server" ID="InvestmentProperty1MonthlyRepayments" class="text-right"></asp:Label></td>
                                            <td class="text-right">
                                                <asp:Label runat="server" ID="InvestmentProperty2MonthlyRepayments" class="text-right"></asp:Label></td>
                                            <td class="text-right">
                                                <asp:Label runat="server" ID="InvestmentProperty3MonthlyRepayments" class="text-right"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><span class="text-success">Net Home Value at Retirement ($)</span></td>
                                            <td class="text-right">
                                                <asp:Label runat="server" ID="InvestmentProperty1NetHomeValueAtRetirement" class="text-right h4"></asp:Label></td>
                                            <td class="text-right">
                                                <asp:Label runat="server" ID="InvestmentProperty2NetHomeValueAtRetirement" class="text-right h4"></asp:Label></td>
                                            <td class="text-right">
                                                <asp:Label runat="server" ID="InvestmentProperty3NetHomeValueAtRetirement" class="text-right h4"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </main>
    </div>

    <footer class="border-top footer text-muted">
        <div class="container">
            &copy; 2020 - One50Group Wealth Tracker - <a href="privacry.aspx">Privacy</a>
        </div>
        <div class="container">
            <div runat="server" id="panelDebug"></div>
        </div>
    </footer>
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.src.js"></script>
    <script src="/js/json2.js"></script>
    <script src="/js/wealthtracker.js"></script>
</body>
</html>
