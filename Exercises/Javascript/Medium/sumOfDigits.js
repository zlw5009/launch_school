// Write a method that takes one argument, a positive integer,
// and returns the sum of its digits. Do this without using any 
// basic looping constructs.

// Examples:

// sum(23)          // 5
// sum(496)         // 19
// sum(123456789)   // 45

function sum(number) {
  return number.toString().split('').map((stringNum) => parseInt(stringNum, 10))
  .reduce((sum, num) => sum + num);
}

console.log(sum(123456789));