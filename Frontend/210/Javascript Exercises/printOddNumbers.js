function printOddNumbers(number) {
  for(var i = 1; i <= number; i++) {
    if (i % 2 === 1) {
      console.log(i);
    }
  }
}

printOddNumbers(19);