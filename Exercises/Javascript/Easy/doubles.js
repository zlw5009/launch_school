// A double number is an even length number whose left-side digits are 
// exactly the same as its right-side digits. 
// For example, 44, 3333, 103103, 7676 are all double numbers. 
// 444, 334433, and 107 are not.

// Write a function that returns 2 times the number provided as an argument,
// unless the argument is a double number; double numbers should be returned as-is.

// Examples:

// twice(37)                 // 74
// twice(44)                 // 44
// twice(334433)             // 668866
// twice(444)                // 888
// twice(107)                // 214
// twice(103103)             // 103103
// twice(3333)               // 3333
// twice(7676)               // 7676

function twice(number) {
  return isDouble(number) ? number : number * 2;
}

function isDouble(number) {
  var numberString = number.toString();
  var center = numberString.length / 2;
  return numberString.substring(0, center) === numberString.substring(center);
}

console.log(twice(37));
console.log(twice(44));
console.log(twice(444));
console.log(twice(103103));