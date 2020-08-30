$(document).ready(function () {

    //initializeInvestmentProperties();
});
// Invesment Properties Manipulation

function initializeInvestmentProperties() {

    for (i = 1; i <= 6; i++) {

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

    for (i = idx; i <= 6; i++) {

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

    for (i = idx; i <= 5; i++) {

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

    for (i = idx + 1; i <= 6; i++) {
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