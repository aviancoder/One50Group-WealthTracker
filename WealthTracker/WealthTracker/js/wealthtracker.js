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
                stacking: 'normal'
            }
        },
        series: [
            { stack: 1, type: 'area', name: 'Cash', data: [], lineWidth: 0 },
            { stack: 1, type: 'area', name: 'Share / Business', data: [], lineWidth: 0 },
            { stack: 1, type: 'area', name: 'Kiwi Saver', data: [], lineWidth: 0 },
            { stack: 1, type: 'area', name: 'Home', data: [], lineWidth: 0 },
            { stack: 1, type: 'area', name: 'Investment / Inheritance', data: [], lineWidth: 0 },
            { stack: 2, type: 'spline', name: 'Debt', data: [], lineWidth: 4 },
            {
                stack: 3, type: 'spline', name: 'Current Assets', data: [], lineWidth: 4
                , dataLabels: {
                    formatter: function () {
                        return '<b>' + this.series.name + ' $' + Highcharts.numberFormat(this.y, 0, '.', ',') + '</b>';
                    }
                }
            },
            {
                stack: 4, type: 'spline', name: 'Financial Goal', data: [], lineWidth: 4
                , dataLabels: {
                    formatter: function () {
                        return '<b>' + this.series.name + ' $' + Highcharts.numberFormat(this.y, 0, '.', ',') + '</b>';
                    }
                }
            }
        ]
    };
    chart = Highcharts.chart('ChartContainer', options);

    initializeInvestmentProperties();
});

// Data

function requestData() {
    //Test();
    getCash();
    getShareBusiness();
    getKiwiSaver();
    getHome();
    getInvestmentInheritance();
    getCurrentAssets();
    //getInvestmentProperty1();
    //getInvestmentProperty2();
    getInvestmentProperties();
    getDebt();
    getFinancialGoal();
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
            chart.series[0].setData(dataItems, false);
            chart.redraw();
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
            chart.series[1].setData(dataItems, false);
            chart.redraw();
        },
        cache: false
    });
}

function getKiwiSaver() {
    $.ajax({
        url: '/dataservice.asmx/GetKiwiSaver',
        type: "POST",
        dataType: "json",
        contentType: 'application/json',
        data: {},
        success: function (data) {
            data = data["d"];
            var dataItems = new Array();
            data.forEach(function (arrayItem) {
                dataItems.push(arrayItem.CumulativeKiwiSaver);
            });
            chart.series[2].setData(dataItems, false);
            chart.redraw();
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
            chart.series[3].setData(dataItems, false);
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
            chart.series[4].setData(dataItems, false);
            chart.redraw();
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
                dataItems.push(arrayItem.CumulativeCurrentDebt);
            });
            chart.series[5].setData(dataItems, false);
            chart.redraw();
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
            chart.series[6].setData(dataItems, false);
            chart.redraw();
            chart.series[6].points[chart.series[6].points.length - 1].update({
                dataLabels: { enabled: true }
            });
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
            chart.series[7].setData(dataItems, false);
            chart.redraw();
            chart.series[7].points[chart.series[7].points.length - 1].update({
                dataLabels: { enabled: true },
                color: '#000000'
            });
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