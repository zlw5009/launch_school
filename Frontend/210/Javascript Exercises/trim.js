function trim(string) {
  var newString = trimLeft(string);
  newString = trimRight(newString);

  return newString;
}

function trimLeft(string) {
  var newString = '';
  var copyMode = false;

  for (var i = 0; i < string.length; i++) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString += string[i];
    }
  }

  return newString;
}

function trimRight(string) {
  var newString = '';
  var copyMode = false;

  for (var i = string.length - 1; i >= 0; i--) {
    if (string[i] !== ' ') {
      copyMode = true;
    }

    if (copyMode) {
      newString = string[i] + newString;
    }
  }

  return newString;
}


var string = '   abc   ';

console.log(trim(string));