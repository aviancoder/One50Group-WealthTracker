// Chart
var chart;

$(document).ready(function () {
    var options = {
        lang: {
            decimalPoint: '.',
            thousandsSep: '\u002C'
        },
        chart: {
            events: {
                load: requestData
            },
            style: {
                fontFamily: 'Poppins'
            }
        },
        title: {
            text: 'Wealth Tracker',
            style: {
                color: '#17a2b8',
                fontSize: '1.5rem',
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + ' $' + Highcharts.numberFormat(this.y, 0, '.', ',') + '</b>';
            }
        },

        xAxis: {
            title: {
                text: 'Years to Retirement'
            }
        },
        yAxis: {
            title: {
                text: 'Asset Value'
            },
            reversedStacks: false
        },
        legend: {
            enabled: true
        },
        exporting: {
            enabled: false
        },
        plotOptions: {
            series: {
                marker: {
                    enabled: false
                },
                stacking: 'normal',
                dataLabels: {
                    style: {
                        textShadow: false,
                        textOutline: '1px #FFFFFF',
                        color: '#000000'
                    },
                    formatter: function () {
                        return '<span style="color: #000000;>' + this.series.name + ' $' + Highcharts.numberFormat(this.y, 0, '.', ',') + '</span>';
                    }
                }
            }
        },
        series: []
    };
    chart = Highcharts.chart('ChartContainer', options);

    initializeInvestmentProperties();
    initializeCurrentInvestmentProperties();
});

// Data

function requestData() {
    //Test();
    getCash();
    //getShareBusiness();
    //getKiwiSaverClient();
    //getKiwiSaverSpouse();
    //getHome();
    //getInvestmentInheritance();
    //getCurrentAssets();
    //getInvestmentProperties();
    //getDebt();
    //getFinancialGoal();
}

function Test() {
    $.ajax({
        url: '/cashsavings.asmx/HelloWorld',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            alert(JSON.stringify(data));
        },
        complete: function (data, status) {
            alert("complete " + JSON.stringify(data));
        },
        cache: false
    });
}

function getCash() {
    $.ajax({
        url: '/dataservice.asmx/GetCashSavings',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {

            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeCashSavings);
            });
            chart.addSeries({
                name: "Cash",
                data: dataItems,
                dataLabels: { enabled: false },
                type: 'area',
                stack: 1,
                lineWidth: 0
            });
            chart.redraw();
        },
        complete: function (data, status) {
            getShareBusiness();
        },
        cache: false
    });
}

function getShareBusiness() {
    $.ajax({
        url: '/dataservice.asmx/GetShareBusiness',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeShareBusiness);
            });
            chart.addSeries({
                name: "Share/Business",
                data: dataItems,
                dataLabels: { enabled: false },
                type: 'area',
                stack: 1,
                lineWidth: 0
            });
            chart.redraw();
        },
        complete: function (data, status) {
            getKiwiSaverClient();
        },
        cache: false
    });
}

function getKiwiSaverClient() {
    $.ajax({
        url: '/dataservice.asmx/GetKiwiSaverClient',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            var kiwiSaverName = "KiwiSaver"
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeKiwiSaver);
                kiwiSaverName = arrayItem.KiwiSaverName + " KiwiSaver";
            });
            chart.addSeries({
                name: kiwiSaverName,
                data: dataItems,
                dataLabels: { enabled: false },
                type: 'area',
                stack: 1,
                lineWidth: 0
            });
            chart.redraw();
        },
        complete: function (data, status) {
            getKiwiSaverSpouse();
        },
        cache: false
    });
}

function getKiwiSaverSpouse() {
    $.ajax({
        url: '/dataservice.asmx/GetKiwiSaverSpouse',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            var kiwiSaverName = "KiwiSaver"
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeKiwiSaver);
                kiwiSaverName = arrayItem.KiwiSaverName + " KiwiSaver";
            });
            chart.addSeries({
                name: kiwiSaverName,
                data: dataItems,
                dataLabels: { enabled: false },
                type: 'area',
                stack: 1,
                lineWidth: 0
            });
            chart.redraw();

        },
        complete: function (data, status) {
            getCurrentInvestmentProperties();
        },
        cache: false
    });
}

function getCurrentInvestmentProperties() {
    $.ajax({
        url: '/dataservice.asmx/GetCurrentInvestmentProperties',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            data.forEach(function (currentInvestmentPropertyData) {
                var dataItems = new Array();
                currentInvestmentPropertyData.InvestmentPropertyList.forEach(function (arrayItem) {
                    dataItems.push(arrayItem.NetPropertyWealth);
                });
                chart.addSeries({
                    name: currentInvestmentPropertyData.InvestmentPropertyName,
                    data: dataItems,
                    dataLabels: { enabled: false },
                    type: 'area',
                    stack: 1,
                    lineWidth: 0
                });
            });
            chart.redraw();
        },
        complete: function (data, status) {
            getInvestmentInheritance();
        },
        cache: false
    });
}

function getHome() {
    $.ajax({
        url: '/dataservice.asmx/GetHome',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.NetPropertyWealth);
            });
            chart.series[4].setData(dataItems, false);
            chart.redraw();
        },
        cache: false
    });
}

function getInvestmentInheritance() {
    $.ajax({
        url: '/dataservice.asmx/GetInvestmentInheritance',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeInheritanceInvestment);
            });
            chart.addSeries({
                name: "Investment / Inheritance",
                data: dataItems,
                dataLabels: { enabled: false },
                type: "area",
                stack: 1,
                lineWidth: 0
            });
            chart.redraw();
        },
        complete: function (data, status) {
            getDebt();
        },
        cache: false
    });
}


function getDebt() {
    $.ajax({
        url: '/dataservice.asmx/GetCurrentDebt',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(-arrayItem.CumulativeCurrentDebt);
            });
            chart.addSeries({
                name: "Debt",
                data: dataItems,
                dataLabels: { enabled: false },
                type: "spline",
                stack: 2,
                lineWidth: 4,
            });
            chart.redraw();
        },
        complete: function (data, status) {
            getCurrentAssets();
        },
        cache: false
    });
}

function getCurrentAssets() {
    $.ajax({
        url: '/dataservice.asmx/GetCurrentAssets',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeCurrentAssets);
            });
            chart.addSeries({
                name: "Current Assets",
                data: dataItems,
                dataLabels: { enabled: false },
                type: "spline",
                stack: 3,
                lineWidth: 4
            });
            chart.redraw();
            chart.series[chart.series.length - 1].points[chart.series[chart.series.length - 1].points.length - 1].update({
                dataLabels: { enabled: true }
            });
        },
        complete: function (data, status) {
            getFinancialGoal();
        },
        cache: false
    });
}

function getFinancialGoal() {
    $.ajax({
        url: '/dataservice.asmx/GetFinancialGoal',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeFinancialGoal);
            });
            chart.addSeries({
                name: "Financial Goal",
                data: dataItems,
                dataLabels: { enabled: false },
                type: "spline",
                stack: 4,
                lineWidth: 4
            });
            chart.redraw();
            chart.series[chart.series.length - 1].points[chart.series[chart.series.length - 1].points.length - 1].update({
                dataLabels: { enabled: true }
            });
        },
        complete: function (data, status) {
            getInvestmentProperties();
        },
        cache: false
    });
}

function getInvestmentProperties() {
    $.ajax({
        url: '/dataservice.asmx/GetInvestmentProperties',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            data.forEach(function (investmentPropertyData) {
                var dataItems = new Array();
                investmentPropertyData.InvestmentPropertyList.forEach(function (arrayItem) {
                    dataItems.push(arrayItem.NetPropertyWealth);
                });
                chart.addSeries({
                    name: investmentPropertyData.InvestmentPropertyName,
                    data: dataItems,
                    dataLabels: { enabled: false },
                    type: 'area',
                    stack: 1,
                    lineWidth: 0
                });
            });
            chart.redraw();
        },
        complete: function (data, status) {
            // do nothing
        },
        cache: false
    });
}

// Invesment Properties Manipulation

function initializeInvestmentProperties() {

    for (i = 1; i <= 20; i++) {

        var noValue = true;
        var elemPropertyName = $("#InvestmentPropertyName" + i)

        if (elemPropertyName) {
            var propertyName = elemPropertyName.val();
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
        var elemPropertyName = $("#InvestmentPropertyName" + i);

        if (elemPropertyName) {
            var propertyName = elemPropertyName.val();
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

        var nextPropertyName = $("#InvestmentPropertyName" + (i + 1)).val();
        if (nextPropertyName.length > 0) {
            // perform transfer
            $("#InvestmentPropertyName" + i).val($("#InvestmentPropertyName" + (i + 1)).val());
            $("#InvestmentPropertyName" + (i + 1)).val("");
            $("#lblInvestmentPropertyName" + i).text($("#lblInvestmentPropertyName" + (i + 1)).text());
            $("#lblInvestmentPropertyName" + (i + 1)).text("");
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
            $("#InvestmentPropertyAnnualAppreciationRate" + i).val($("#InvestmentPropertyAnnualAppreciationRate" + (i + 1)).val());
            $("#InvestmentPropertyAnnualAppreciationRate" + (i + 1)).val("");
            $("#InvestmentPropertyMortgageRate" + i).val($("#InvestmentPropertyMortgageRate" + (i + 1)).val());
            $("#InvestmentPropertyMortgageRate" + (i + 1)).val("");
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
        $("#InvestmentPropertyName" + idx).val($("#InvestmentProperty" + idx).val().trim());
        $("#lblInvestmentPropertyName" + idx).text($("#InvestmentProperty" + idx).val().trim());

        if ($("#InvestmentPropertyPurchaseYear" + (idx)).val().length <= 0)
            $("#InvestmentPropertyPurchaseYear" + (idx)).val("0");
        if ($("#InvestmentPropertyRepaymentsBeginYear" + (idx)).val().length <= 0)
            $("#InvestmentPropertyRepaymentsBeginYear" + (idx)).val("0");
        if ($("#InvestmentPropertyValue" + (idx)).val().length <= 0)
            $("#InvestmentPropertyValue" + (idx)).val("0");
        if ($("#InvestmentPropertyDebt" + (idx)).val().length <= 0)
            $("#InvestmentPropertyDebt" + (idx)).val("0");
        if ($("#InvestmentPropertyYearsToRepayDebt" + (idx)).val().length <= 0)
            $("#InvestmentPropertyYearsToRepayDebt" + (idx)).val("0");
        if ($("#InvestmentPropertyAnnualAppreciationRate" + (idx)).val().length <= 0)
            $("#InvestmentPropertyAnnualAppreciationRate" + (idx)).val("0");
        if ($("#InvestmentPropertyMortgageRate" + (idx)).val().length <= 0)
            $("#InvestmentPropertyMortgageRate" + (idx)).val("0");
        togglePropertyWithValue(idx);
        initializeInvestmentProperties();
    }
}

function removeProperty(idx) {
    $("#InvestmentPropertyName" + idx).val("");
    transferValuesToPredecessor(idx);
    initializeInvestmentProperties();
}

function editProperty(idx) {
    $("#InvestmentProperty" + idx).val($("#InvestmentPropertyName" + idx).val());
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

// Current Investment Properties
function initializeCurrentInvestmentProperties() {

    for (i = 1; i <= 6; i++) {

        var noValue = true;
        var elemPropertyName = $("#CurrentInvestmentPropertyName" + i)

        if (elemPropertyName) {
            var propertyName = elemPropertyName.val();
            if (propertyName.length > 0)
                noValue = false;
        }
        if (noValue) {
            // set this node as ready to add and hide succeeding elements
            toggleCurrentPropertyToReadyToAdd(i);
            hideAllSucceedingCurrentProperties(i);
            return;
        }
        else {
            toggleCurrentPropertyWithValue(i);
        }
    }
}

function toggleCurrentInvestmentProperties(idx) {

    for (i = idx; i <= 20; i++) {

        var noValue = true;
        var elemPropertyName = $("#CurrentInvestmentPropertyName" + i);

        if (elemPropertyName) {
            var propertyName = elemPropertyName.val();
            if (propertyName.length > 0)
                noValue = false;
        }
        if (noValue) {
            // set this node as ready to add and hide succeeding elements
            toggleCurrentPropertyToReadyToAdd(i);
            hideAllSucceedingCurrentProperties(i);
            return;
        }
        else {
            toggleCurrentPropertyWithValue(i);
        }
    }
}

function transferCurrentValuesToPredecessor(idx) {

    for (i = idx; i <= 19; i++) {

        var nextPropertyName = $("#CurrentInvestmentPropertyName" + (i + 1)).val();
        if (nextPropertyName.length > 0) {
            // perform transfer
            $("#CurrentInvestmentPropertyName" + i).val($("#CurrentInvestmentPropertyName" + (i + 1)).val());
            $("#CurrentInvestmentPropertyName" + (i + 1)).val("");
            $("#lblCurrentInvestmentPropertyName" + i).text($("#lblCurrentInvestmentPropertyName" + (i + 1)).text());
            $("#lblCurrentInvestmentPropertyName" + (i + 1)).text("");
            $("#CurrentInvestmentPropertyPurchaseYear" + i).val($("#CurrentInvestmentPropertyPurchaseYear" + (i + 1)).val());
            $("#CurrentInvestmentPropertyPurchaseYear" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyRepaymentsBeginYear" + i).val($("#CurrentInvestmentPropertyRepaymentsBeginYear" + (i + 1)).val());
            $("#CurrentInvestmentPropertyRepaymentsBeginYear" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyValue" + i).val($("#CurrentInvestmentPropertyValue" + (i + 1)).val());
            $("#CurrentInvestmentPropertyValue" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyDebt" + i).val($("#CurrentInvestmentPropertyDebt" + (i + 1)).val());
            $("#CurrentInvestmentPropertyDebt" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyYearsToRepayDebt" + i).val($("#CurrentInvestmentPropertyYearsToRepayDebt" + (i + 1)).val());
            $("#CurrentInvestmentPropertyYearsToRepayDebt" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyAnnualAppreciationRate" + i).val($("#CurrentInvestmentPropertyAnnualAppreciationRate" + (i + 1)).val());
            $("#CurrentInvestmentPropertyAnnualAppreciationRate" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyMortgageRate" + i).val($("#CurrentInvestmentPropertyMortgageRate" + (i + 1)).val());
            $("#CurrentInvestmentPropertyMortgageRate" + (i + 1)).val("");
            $("#CurrentInvestmentPropertyMonthlyRepayments" + i).text($("#CurrentInvestmentPropertyMonthlyRepayments" + (i + 1)).text());
            $("#CurrentInvestmentPropertyMonthlyRepayments" + (i + 1)).text("");
            $("#CurrentInvestmentPropertyNetHomeValueAtRetirement" + i).text($("#CurrentInvestmentPropertyNetHomeValueAtRetirement" + (i + 1)).text());
            $("#CurrentInvestmentPropertyNetHomeValueAtRetirement" + (i + 1)).text("");
        }
        else {
            return;
        }
    }
}

function addsaveCurrentProperty(idx) {
    if ($("#CurrentInvestmentProperty" + idx).val().trim().length > 0) {
        $("#CurrentInvestmentPropertyName" + idx).val($("#CurrentInvestmentProperty" + idx).val().trim());
        $("#lblCurrentInvestmentPropertyName" + idx).text($("#CurrentInvestmentProperty" + idx).val().trim());

        if ($("#CurrentInvestmentPropertyPurchaseYear" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyPurchaseYear" + (idx)).val("0");
        if ($("#CurrentInvestmentPropertyRepaymentsBeginYear" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyRepaymentsBeginYear" + (idx)).val("0");
        if ($("#CurrentInvestmentPropertyValue" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyValue" + (idx)).val("0");
        if ($("#CurrentInvestmentPropertyDebt" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyDebt" + (idx)).val("0");
        if ($("#CurrentInvestmentPropertyYearsToRepayDebt" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyYearsToRepayDebt" + (idx)).val("0");
        if ($("#CurrentInvestmentPropertyAnnualAppreciationRate" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyAnnualAppreciationRate" + (idx)).val("0");
        if ($("#CurrentInvestmentPropertyMortgageRate" + (idx)).val().length <= 0)
            $("#CurrentInvestmentPropertyMortgageRate" + (idx)).val("0");
        toggleCurrentPropertyWithValue(idx);
        initializeInvestmentCurrentProperties();
    }
}

function removeCurrentProperty(idx) {
    $("#CurrentInvestmentPropertyName" + idx).val("");
    transferCurrentValuesToPredecessor(idx);
    initializeInvestmentCurrentProperties();
}

function editCurrentProperty(idx) {
    $("#CurrentInvestmentProperty" + idx).val($("#CurrentInvestmentPropertyName" + idx).val());
    $("#divNewCurrentIP" + idx).show();
    $("#btnAddCurrentIP" + idx).hide();
    $("#btnSaveCurrentIP" + idx).show();
    $("#divUpdateCurrentIP" + idx).hide();
}

function hideAllSucceedingCurrentProperties(idx) {

    for (i = idx + 1; i <= 20; i++) {
        $("#divCardCurrentIP" + i).hide();
    }
}

function toggleCurrentPropertyWithValue(idx) {
    $("#divCardCurrentIP" + idx).show();
    $("#divNewCurrentIP" + idx).hide();
    $("#divUpdateCurrentIP" + idx).show();
    $("#btnEditCurrentIP" + idx).show();
    $("#btnRemoveCurrentIP" + idx).show();
    $("#divTableCurrentIP" + idx).show();
}

function toggleCurrentPropertyToReadyToAdd(idx) {
    $("#divCardCurrentIP" + idx).show();
    $("#divNewCurrentIP" + idx).show();
    $("#btnAddCurrentIP" + idx).show();
    $("#btnSaveCurrentIP" + idx).hide();
    $("#divUpdateCurrentIP" + idx).hide();
    $("#divTableCurrentIP" + idx).hide();
}