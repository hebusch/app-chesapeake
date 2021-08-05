$(document).ready(function() {
    var time = new Date($.now());
    $('#time').text(time.toLocaleString());
    setInterval('updateClock()', 1000);
});

function updateClock() {
    var currentTime = new Date($.now());
    $('#time').text(currentTime.toLocaleString());
}