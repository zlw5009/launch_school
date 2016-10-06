var today = new Date();
var tomorrow = new Date(today);

tomorrow.setDate(today.getDate() + 1);

var nextWeek = new Date(today);

console.log(today.toDateString() === nextWeek.toDateString());

nextWeek.setDate(today.getDate() + 7);

console.log(today.toDateString() === nextWeek.toDateString());

function dateSuffix(date) {
  var suffix = 'th';
  var dateString = date.toString();
  var digit;

  if (dateString.length === 1 ) {
    digit = dateString[0];
  } else if (dateString[0] !== '1') {
    digit = dateString[1];
  }

  if (digit === '1') {
    suffix = 'st';
  } else if (digit === '2') {
    suffix = 'nd';
  } else if (digit === '3') {
    suffix = 'rd';
  }

  return date + suffix;
}

function formattedDate(date) {
  var day = formattedDay(date);
  var month = formattedMonth(date);
  var year = date.getFullYear();

  console.log('Today\'s date is ' + day + ', ' + month + ' ' + dateSuffix(date.getDate()) + ', ' + year);
}

function formattedMonth(date) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[date.getMonth()];
}

function formattedDay(date) {
  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[date.getDay()];
}

function formatTime(date) {
  return addZero(date.getHours()) + ':' + addZero(date.getMinutes());
}

function addZero(val) {
  return String(val).length < 2 ? '0' + val : val;
}

console.log(formatTime(today));

formattedDate(tomorrow);
