// Create a simple tip calculator. The program should prompt for a 
// bill amount and a tip rate. The program must compute the tip and 
// then display both the tip and the total amount of the bill. 
// You can ignore input validation and assume that the user will put in numbers.

// Example:

// What is the bill? 200
// What is the tip percentage? 15

// The tip is $30.0
// The total is $230.0

var bill = prompt('What is the bill?');
var tipPercentage = prompt('What is the tip percentage?');
var tip = bill * (tipPercentage / 100);
var total = (parseFloat(bill, 10) + tip);

console.log('The tip is $' + tip.toFixed(2));
console.log('The total is $' + total.toFixed(2));