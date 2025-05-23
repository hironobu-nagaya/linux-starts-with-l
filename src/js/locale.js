'use strict';

const now = new Date();

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
    const month = (now.getMonth() + 1).toString().padStart(2, ' ');
    const date = now.getDate().toString().padStart(2, ' ');
    const weekday = new Intl.DateTimeFormat('ja-JP', {
        weekday: 'long'
    }).format(now);
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');
    const timezone = 'JST';
    const dateOutput = year + '年'
        + ' ' + month + '月'
        + ' ' + date + '日'
        + ' ' + weekday
        + ' ' + hours + ':' + minutes + ':' + seconds
        + ' ' + timezone;
    $('.ja-date').text(dateOutput);
});

