<%@ Page Language="VB" AutoEventWireup="false" CodeFile="template.aspx.vb" Inherits="template" %>

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
                <div>
                    <asp:TextBox ID="test" runat="server" Text="" class="form-control  text-right one50group-formattednumber" type="text"></asp:TextBox>
                </div>
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

    </script>
</body>
</html>
