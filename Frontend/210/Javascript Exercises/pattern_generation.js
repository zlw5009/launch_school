function generatePattern(number) {
  var string;

  for (var i = 1; i <= number; i++) {
    string = '';

    for (var j = 1; j <= i; j++) {
      string += String(j);
    }

    for (var k = i + 1; k <= number; k++) {
      string += '*';
    }
    
    console.log(string);
  }
}

generatePattern(7);