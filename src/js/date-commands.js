'use strict';

const now = new Date();

$(document).ready(function() {
    const header = 'Su Mo Tu We Th Fr Sa';
    const monthName = new Intl.DateTimeFormat('en-US', {
        month: 'long'
    }).format(now);
    const year = now.getFullYear().toString();
    const bareTitle = monthName + ' ' + year;
    const lengthDiff = header.length - bareTitle.length;
    const title = ' '.repeat(lengthDiff / 2 + (lengthDiff & 1))
        + bareTitle
        + ' '.repeat(lengthDiff / 2);
    const startDate = new Date();
    startDate.setDate(1);
    const endDate = new Date();
    endDate.setMonth(endDate.getMonth() + 1, 0);
    const start =  1 - startDate.getDay() % 7;
    const end = endDate.getDate();
    const current = now.getDate();
    var calendar = title + '<br>' + header + '<br>';
    for (var i = start; i <= end; i += 7) {
        for (var j = 0; j < 7; j++) {
            const target = i + j;
            if (target < 1 || target > end) {
                calendar += '  ';
            } else {
                if (target == current) {
                    calendar += '<span class="revert">'
                        + target.toString().padStart(2, ' ')
                        + '</span>';
                } else {
                    calendar += target.toString().padStart(2, ' ');
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

$(document).ready(function() {
    const weekday = new Intl.DateTimeFormat('en-US', {
        weekday: 'short'
    }).format(now);
    const monthName = new Intl.DateTimeFormat('en-US', {
        month: 'short'
    }).format(now);
    const date = now.getDate().toString();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');
    const timezone = 'JST';
    const year = now.getFullYear().toString();
    const dateOutput = weekday
        + ' ' + monthName
        + ' ' + date
        + ' ' + hours + ':' + minutes + ':' + seconds
        + ' ' + timezone
        + ' ' + year;
    $('.date').text(dateOutput);
});

$(document).ready(function() {
    const year = now.getFullYear().toString();
    const month = (now.getMonth() + 1).toString().padStart(2, '0');
    const date = now.getDate().toString().padStart(2, '0');
    const dateSuffix = year + month + date;
    $('#date-suffix').replaceWith(dateSuffix);
});

$(document).ready(function() {
    const year = now.getFullYear().toString();
    const month = (now.getMonth() + 1).toString();
    const date = now.getDate().toString();
    const today = year + '年' + month + '月' + date + '日';
    $('#today').replaceWith(today);
});

