$(function() {
    $("#currency_conversion_date").datepicker({
        minDate: new Date($("#minDate").val()),
        maxDate: ((new Date()).getDate() - 2),
        dateFormat: 'dd/mm/yy'
    });
})