'use strict';

const now = new Date();

$(document).ready(function() {
    const jstWeekday = new Intl.DateTimeFormat('en-US', {
        weekday: 'short'
    }).format(now);
    const jstYear = now.getFullYear().toString();
    const jstMonth = (now.getMonth() + 1).toString().padStart(2, '0');
    const jstDate = now.getDate().toString().padStart(2, '0');
    const jstHours = now.getHours().toString().padStart(2, '0');
    const jstMinutes = now.getMinutes().toString().padStart(2, '0');
    const jstSeconds = now.getSeconds().toString().padStart(2, '0');
    const jstDateTimeOutput = jstWeekday
        + ' ' + jstYear + '-' + jstMonth + '-' + jstDate
        + ' ' + jstHours + ':' + jstMinutes + ':' + jstSeconds;
    $('.jst-datetime').text(jstDateTimeOutput);
});

$(document).ready(function() {
    const utcWeekday = new Intl.DateTimeFormat('en-US', {
        weekday: 'short',
				timezone: 'UTC'
    }).format(now);
    const utcYear = now.getUTCFullYear().toString();
    const utcMonth = (now.getUTCMonth() + 1).toString().padStart(2, '0');
    const utcDate = now.getUTCDate().toString().padStart(2, '0');
    const utcHours = now.getUTCHours().toString().padStart(2, '0');
    const utcMinutes = now.getUTCMinutes().toString().padStart(2, '0');
    const utcSeconds = now.getUTCSeconds().toString().padStart(2, '0');
    const utcDateTimeOutput = utcWeekday
        + ' ' + utcYear + '-' + utcMonth + '-' + utcDate
        + ' ' + utcHours + ':' + utcMinutes + ':' + utcSeconds;
    $('.utc-datetime').text(utcDateTimeOutput);
});

