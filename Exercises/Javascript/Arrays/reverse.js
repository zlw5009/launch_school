// For this exercise you will re-implement the Array.prototype.reverse() method. 
// This implementation will be differentiated from the built-in, in that it can
// take either a string or an array as an argument and return a new string or array.

function reverse(inputForReversal) {
  var result = [];

  for (var i = inputForReversal.length - 1; i >= 0; i--) {
    result.push(inputForReversal[i]);
  }

  if (Array.isArray(inputForReversal)) {
    return result;
  };

  return result.join('');
}

reverse('Hello');          // elloH
reverse('a')               // a
reverse([1, 2, 3, 4]);     // [4, 3, 2, 1]
reverse([]);               // []