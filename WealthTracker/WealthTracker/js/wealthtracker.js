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
            }
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
            { stack: 1, type: 'area', name: 'Investment Prop 1', data: [], lineWidth: 0 },
            { stack: 1, type: 'area', name: 'Investment Prop 2', data: [], lineWidth: 0 },
            { stack: 1, type: 'area', name: 'Investment Prop 3', data: [], lineWidth: 0 },
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
    getInvestmentProperty1();
    getInvestmentProperty2();
    getInvestmentProperty3();
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

function getInvestmentProperty1() {
    $.ajax({
        url: '/dataservice.asmx/GetInvestmentProperty1',
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
            chart.series[0].setData(dataItems, false);
            chart.redraw();
        },
        cache: false
    });
}

function getInvestmentProperty2() {
    $.ajax({
        url: '/dataservice.asmx/GetInvestmentProperty2',
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
            chart.series[1].setData(dataItems, false);
            chart.redraw();
        },
        cache: false
    });
}

function getInvestmentProperty3() {
    $.ajax({
        url: '/dataservice.asmx/GetInvestmentProperty3',
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
            chart.series[2].setData(dataItems, false);
            chart.redraw();
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
            chart.series[3].setData(dataItems, false);
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
            chart.series[4].setData(dataItems, false);
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
            chart.series[5].setData(dataItems, false);
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
            chart.series[6].setData(dataItems, false);
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
            chart.series[7].setData(dataItems, false);
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
            chart.series[8].setData(dataItems, false);
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
            chart.series[9].setData(dataItems, false);
            chart.redraw();
            chart.series[9].points[chart.series[9].points.length - 1].update({
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
            chart.series[10].setData(dataItems, false);
            chart.redraw();
            chart.series[10].points[chart.series[10].points.length - 1].update({
                dataLabels: {enabled: true}
            });
        },
        cache: false
    });
}

//function getData() {
//        fetch('/api/DataMaster').then(function (response) {
//            return response.json()
//        }).then(function (data) {

//            data.forEach(function (arrayItem) {
//                var vx = arrayItem.yearsToRetire;
//                var vy = arrayItem.cumulativeKiwiSaver;
//                chart.series[0].addPoint({ x: vx, y: vy });
//                chart.series[1].addPoint({ x: vx, y: vy });
//                chart.series[2].addPoint({ x: vx, y: vy });
//                chart.series[3].addPoint({ x: vx, y: vy });
//            });

//})
//}