function repeatedCharacters(string) {
  var result = {};
  var lowerCaseString = string.toLowerCase();

  for (var i = 0; i < lowerCaseString.length; i++) {
    if (result[lowerCaseString[i]] !== undefined ) {
      result[lowerCaseString[i]] += 1;
    } else {
      result[lowerCaseString[i]] = 1;
    }
  }

  for (var key in result) {
    if (result[key] === 1) {
      delete result[key];
    }
  }

  return result;
}