'use strict';

$(document).ready(function() {
    const now = new Date();

    // date-suffix
    const year = now.getFullYear().toString();
    const month = (now.getMonth() + 1).toString();
    const date = now.getDate().toString();
    $('#date-suffix').replaceWith(
        year
        + month.padStart(2, '0')
        + date.padStart(2, '0'));

    // today
    $('#today').replaceWith(
        year
        + '年'
        + month
        + '月'
        + date
        + '日');

    // date
    const weekday = new Intl.DateTimeFormat('en-US', { weekday: 'short' }).format(now);
    const monthName = new Intl.DateTimeFormat('en-US', { month: 'short' }).format(now);
    const hours = (now.getHours()).toString().padStart(2, '0');
    const minutes = (now.getMinutes()).toString().padStart(2, '0');
    const seconds = (now.getSeconds()).toString().padStart(2, '0');
    const timezone = 'JST';
    $('.date').text(
        weekday
        + ' '
        + monthName
        + ' '
        + date
        + ' '
        + hours
        + ':'
        + minutes
        + ':'
        + seconds
        + ' '
        + timezone
        + ' '
        + year);

    // calendar
    const header = 'Su Mo Tu We Th Fr Sa';
    const longMonthName = new Intl.DateTimeFormat('en-US', { month: 'long' }).format(now);
    const bareTitle = longMonthName + ' ' + year;
    const lengthDiff = header.length - bareTitle.length;
    const title = ' '.repeat(lengthDiff / 2 + (lengthDiff & 1))
        + bareTitle
        + ' '.repeat(lengthDiff / 2);
    const startDate = new Date()
    startDate.setDate(1);
    const endDate = new Date();
    endDate.setMonth(endDate.getMonth() + 1);
    endDate.setDate(0);
    const startDay =  1 - startDate.getDay() % 7;
    const endDay = endDate.getDate();
    const currentDay = now.getDate();
    var calendar = title
        + '<br>'
        + header
        + '<br>';
    for (var i = startDay; i <= endDay; i += 7) {
        for (var j = 0; j < 7; j++) {
            const targetDay = i + j;
            if (targetDay < 1 || targetDay > endDay) {
                calendar += '  ';
            } else {
                if (targetDay == currentDay) {
                    calendar += '<span class="revert">'
                        + targetDay.toString().padStart(2, ' ')
                        + '</span>';
                } else {
                    calendar += targetDay.toString().padStart(2, ' ');
                }
            }
            if (j < 6) {
                calendar += ' ';
            }
        }
        calendar += '<br>';
    }
    $('.calendar').html(calendar);
});

