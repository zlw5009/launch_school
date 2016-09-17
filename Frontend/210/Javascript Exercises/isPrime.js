function isPrime(number) {
  if (number <= 1 || (number > 2 && number % 2 === 0)) {
    return false;
  }

  var divisor = 3; 

  while (divisor < number) {
    if (number % divisor === 0) {
      return false;
    }
  }

  return true; 
}