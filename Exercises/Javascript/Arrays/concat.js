// In this exercise we are going to learn more about arrays by implementing our
// version of the Array.prototype.concat() method. We will write a function that 
// returns a new array composed of the first array argument and the second array 
// or value arugment. Take note of the following specifications when writing your 
// own concat function.

// The first argument is an array. For simplicity, you can assume that this will 
// always be the case.
// The concatenation returns a new array
// The order of passing the array arguments will be followed
// Object references are copied to the new array. If changes are made to the 
// source/reference array then it is also reflected in the new array
// For strings, numbers, and, booleans the concatenation copies the values

function concat(array1, secondArgument) {
  var result = array1;

  if (Array.isArray(secondArgument)) {
    for (var i = 0; i < secondArgument.length; i++) {
      result[result.length] = secondArgument[i];
    };
  } else {
    result[result.length] = secondArgument;
  }

  console.log(result);
}


concat([1, 2, 3], [4, 5, 6]);            // [1, 2, 3, 4, 5, 6]
concat([1, 2], 3);                       // [1, 2, 3]
concat([2, 3], ['two', 'three']);        // [2, 3, "two", "three"]
concat([2, 3], 'four');                  // [2, 3, "four"]


var obj = { a: 2, b: 3 };
var newArray = concat([2, 3], obj);     // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
newArray;                                // [2, 3, { a: 'two', b: 3 }]