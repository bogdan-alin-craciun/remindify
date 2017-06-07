$(document).ready(function () {
    // get current URL path and assign 'active' class
    var pathname = window.location.pathname;
    $('.nav > li > a[href="/' + pathname.split("/")[1] + '"]').parent().addClass('active');
})