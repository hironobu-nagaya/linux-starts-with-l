'use strict';

const now = new Date();

$(document).ready(function() {
    const month = (now.getMonth() + 1).toString();
    const date = now.getDate().toString();
    const todayOutput = month + '月' + date + '日';
    $('.today').text(todayOutput);
});

