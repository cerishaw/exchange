$(function() {
    $("#currency_conversion_date").datepicker({
        minDate: new Date($("#minDate").val()),
        maxDate: new Date(),
        dateFormat: 'dd/mm/yy'
    });
})