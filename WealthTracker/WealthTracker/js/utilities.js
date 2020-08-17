$(document).ready(function () {
    $(".one50group-formattednumber").on('change, keyup', function () {
        var currentInput = $(this).val();
        var targetPattern = new RegExp(/[^0-9.,]/g);
        var haveNonNumbers = targetPattern.test(currentInput);
        var fixedInput = currentInput.replace(targetPattern, "");
        var cpos = getCaretPosition(this);
        if (fixedInput === "")
            fixedInput = 0;
        $(this).val(fixedInput);

        // move caret to correct position after removing non numbers
        if (haveNonNumbers == true)
            setCaretPosition(this, cpos);
    });
});

function setCaretPosition(elem, caretPos) {
    if (elem != null) {
        if (elem.createTextRange) {
            var range = elem.createTextRange();
            range.move('character', caretPos);
            range.select();
        }
        else {
            if (elem.selectionStart) {
                elem.focus();
                elem.setSelectionRange(caretPos, caretPos);
            }
            else
                elem.focus();
        }
    }
}
function getCaretPosition(elem) {
    // Initialize
    var iCaretPos = 0;

    // IE Support
    if (document.selection) {

        // Set focus on the element
        elem.focus();
        var oSel = document.selection.createRange();

        // Move selection start to 0 position
        oSel.moveStart('character', -elem.value.length);

        // The caret position is selection length
        iCaretPos = oSel.text.length;
    }

    // Firefox support
    else if (elem.selectionStart || elem.selectionStart == '0')
        iCaretPos = elem.selectionDirection == 'backward' ? elem.selectionStart : elem.selectionEnd;

    // Return results
    if (iCaretPos > 0)
        iCaretPos = iCaretPos - 1;
    return iCaretPos;
}

function formatNumberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}