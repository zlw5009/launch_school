// Build a program that asks a user for the length and width of a 
// room in meters and then logs to the console the area of the room 
// in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. 
// Assuming you run this program in the browser, you can use 
// the prompt() function to collect inputs.

// Enter the length of the room in meters:
// 10
// Enter the width of the room in meters:
// 7
// The area of the room is 70.0 square meters (753.47 square feet).

function squareFeetAndMeters () {
  var length = prompt('Enter the length of the room in meters:');
  var width = prompt('Enter the width of the room in meters:');
  var squareMeters = length * width;
  var squareFeet = squareMeters * 10.7639;

  console.log('The area of the room is ' + squareMeters.toFixed(2) + 
    ' square meters (' + squareFeet.toFixed(2) + ').');
}