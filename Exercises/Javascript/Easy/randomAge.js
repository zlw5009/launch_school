// Build a program that randomly generates and prints Teddy's age. 
// To get the age, you should generate a random number between 20 and 200.

// Example Output

// Teddy is 69 years old!

function randomNumber(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

var age = randomNumber(20, 200); 

console.log('Teddy is ' + age + ' years old!');