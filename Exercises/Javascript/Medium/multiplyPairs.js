// Write a function that takes two Array arguments in which each Array
// contains a list of numbers, and returns a new Array that contains the
// product of every pair of numbers that can be formed between the elements
// of the two Arrays. The results should be sorted by increasing value.

// You may assume that neither argument is an empty Array.

// Examples:

// multiplyAllPairs([2, 4], [4, 3, 1, 2]) // [2, 4, 4, 6, 8, 8, 12, 16]

function multiplyAllPairs(ary1, ary2) {
  var result = [];

  for (var i = 0; i < ary1.length; i++) {
    ary2.forEach((number) => result.push(ary1[i] * number));
  }

  return result.sort((a, b) => a - b);
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));