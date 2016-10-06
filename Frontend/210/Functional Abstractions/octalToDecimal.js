function octalToDecimal(numberString) {
  var decimalParts = numberString.split('').map(function(digitChar, index) {
    // convert digitChar to numbers and apply power of eights
    return Number(digitChar) * Math.pow(8, numberString.length - index - 1);
  });

  return decimalParts.reduce(function(sum, number) {
    // sum them up
    return sum + number;
  });
}