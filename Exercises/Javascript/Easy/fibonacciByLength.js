// The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) 
// such that the first 2 numbers are 1 by definition, and each subsequent number
// is the sum of the two previous numbers. This series appears throughout the
// natural world.

// Computationally, the Fibonacci series is a very simple series, but the results
// grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
// 354,224,848,179,261,915,075 -- that's enormous, especially considering that
// it takes 6 iterations to enter the 2 digit numbers.

// Write a function that calculates and returns the index of the first Fibonacci
// number that has the number of digits specified as an argument. 
// (The first Fibonacci number has index 1.)

// Examples:

// findFibonacciIndexByLength(2)     // 7
// findFibonacciIndexByLength(10)    // 45
// findFibonacciIndexByLength(23)    // 485

// Algorithm:
// - pass the number of digits into fibonacci function
// - find the next number in the fibonacci sequence until 
//   the last number has as many digits as the number passed in

// - fib sequence = a, b, c => a + b = c
//   - c.toString().length === number ? return index of c : fib sequence;

function findFibonacciIndexByLength(length) {
  var fibonacci;
  var a = 1;
  var b = 1;
  var index = 2;

  do {
    fibonacci = a + b;
    index++;
    a = b;
    b = fibonacci;
  } while (fibonacci.toString().length < length);

  return index;
}

console.log(findFibonacciIndexByLength(2));
