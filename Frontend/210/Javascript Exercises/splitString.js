function splitString(string, delimiter) {
  var tempString = '';

  for (var i = 0; i < string.length; i++) {
    if (string[i] !== delimiter) {
      tempString += string[i];
    } else if (string[i] === delimiter) {
      console.log(tempString);
      tempString = '';
    } else if (delimiter === '') {
      console.log(string[i]);
    }
  }

  if (tempString) {
    console.log(tempString);
  }
}

splitString('abc,123,hello world', ',');