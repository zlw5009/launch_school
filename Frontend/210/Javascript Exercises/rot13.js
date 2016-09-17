function upperAsciiCipherNum(char) {
  var code = 0;
  var charAsciiNum = char.charCodeAt(0);

  if (charAsciiNum > 77) {
    code = 65 + (13 - (90 - charAsciiNum) - 1);
  } else {
    code = charAsciiNum + 13;
  }

  return code;
}

function lowerAsciiCipherNum(char) {
  var charAsciiNum = char.charCodeAt(0);

  if (charAsciiNum > 109) {
    code = 97 + (13 - (122 - charAsciiNum) - 1);
  } else {
    code = charAsciiNum + 13;
  }

  return code;
}

function rot13(string) {
  var cipher = '';
  var asciiCode = 0;

  for (var i = 0; i < string.length; i++) {
    if (!string[i].match(/[a-z]/i)) {
      cipher += string[i];
      continue;
    }

    if (string[i] === string[i].toUpperCase()) {
      asciiCode = upperAsciiCipherNum(string[i])
    } else {
      asciiCode = lowerAsciiCipherNum(string[i])
    }

    cipher += String.fromCharCode(asciiCode);

  }

  return cipher;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));



