function rot13(string) {
  var alphabet = 'abcdefghijklmnopqrstuvwxyz'
  var cipher = '';
  var index = 0;

  for (var i = 0; i < string.length; i++) {
    if (!string[i].match(/[a-z]/i)) {
      cipher += string[i];
      continue;
    }

    if (string[i] === string[i].toUpperCase()) {
      alphabet = alphabet.toUpperCase();
    } else {
      alphabet = alphabet.toLowerCase();
    }

    index = alphabet.indexOf(string[i]) + 13;
    
    if (index > 25) {
      cipher += alphabet[index - 26];
    } else {
      cipher += alphabet[index];
    }
  }

  return cipher;
}