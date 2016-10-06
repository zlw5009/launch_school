// Write a program that asks the user to enter an integer greater than 0,
// then asks if the user wants to determine the sum or product of all
// numbers between 1 and the entered integer.

// Examples:

// Please enter an integer greater than 0: 5
// Enter 's' to compute the sum, 'p' to compute the product. s

// The sum of the integers between 1 and 5 is 15.
// Please enter an integer greater than 0: 6
// Enter 's' to compute the sum, 'p' to compute the product. p

// The product of the integers between 1 and 6 is 720.

function computeSum(number) {
  var sum = 0;

  for (var i = 1; i <= number; i++) {
    sum += i;
  }

  return sum;
}

function computeProduct(number) {
  var product = 1;

  for (var i = 1; i <= number; i++) {
    product *= i;
  }

  return product;
}

var number = parseInt(prompt('Enter an integer greather than 0:'));
var operation = prompt('Enter \'s\' to compute the sum, \'p\' to compute the product.').toLowerCase();

if (operation == 's') {
  var sum = computeSum(number);
  console.log('The sum of the integers between 1 and ' + number + ' is ' + sum + '.');
} else if (operation == 'p') {
  var product = computeProduct(number);
  console.log('The product of the integers between 1 and ' + number + ' is ' + product + '.');
} else {
  console.log('Oops. Unknown operation.');
}
