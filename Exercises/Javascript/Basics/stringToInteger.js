var DIGITS = {
  '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9
}

function stringToInteger(string) {
  var value = 0;
  var numbers = stringToNumbers(string);

  for (var i = 0; i < numbers.length; i++) {
    value = 10 * value + numbers[i];
  }

  return value;
}

function stringToNumbers(string) {
  var result = [];

  for (var i = 0; i < string.length; i++) {
    result.push(DIGITS[string[i]]);
  }

  return result;
}

function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default:  return stringToInteger(string);
  };
}