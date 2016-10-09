// Write a function that returns a list of all substrings of a string that
// start at the beginning of the original string. The return value should be
// arranged in order from shortest to longest substring.

// Examples:

// substringsAtStart('abc')   // ['a', 'ab', 'abc']
// substringsAtStart('a')     // ['a']
// substringsAtStart('xyzzy') // ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

// Write a method that returns a list of all substrings of a string. The returned
// list should be ordered by where in the string the substring begins. This means
// that all substrings that start at position 0 should come first, then all substrings
// that start at position 1, and so on. Since multiple substrings will occur at each
// position, the substrings at a given position should be returned in order from
// shortest to longest.

// You may (and should) use the substringsAtStart function you wrote in the previous
// exercise:

// Examples:

// substrings('abcde');
// // result
// [ 'a', 'ab', 'abc', 'abcd', 'abcde',
//   'b', 'bc', 'bcd', 'bcde',
//   'c', 'cd', 'cde',
//   'd', 'de',
//   'e' ]

function substringsAtStart(string) {
  var result = [];

  for (var i = 0; i < string.length; i++) {
    result.push(string.substr(0, i+1));
  }

  return result;
}

function substrings(string) {
  return string.split('').map(function(char, idx) {
    return substringsAtStart(string.substring(idx));
  }).reduce(function(result, array) {
    return result.concat(array);
  });
}

console.log(substrings('xyzzy')); // ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
