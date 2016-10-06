// Re-implement the Array.prototpye.shift() and Array.prototype.unshift() methods. 
// The shift function removes the first element of an array and returns the new array. 
// The unshift function adds one or more elements to the start of an array and returns the new array.

// If shift is used on an array with a length of 0 then undefined is returned.

function shift(array) {
  var shifted = array[0];

  if (array.length === 0) {
    return undefined;
  }

  for (var i = 0; i < array.length; i++) {
    array[i] = array[i+1];
  }

  array.length = array.length - 1;

  return shifted;
}

function unshift(array) {
  var temp = [];

  for (var i = 0; i < array.length; i++) {
    temp[i] = array[i];
  }

  for (var j = 1, k = 0; j < arguments.length; j++, k++) {
    array[k] = arguments[j];
  }

  array.length = arguments.length - 1

  for (var l = 0; l < temp.length; l++) {
    array[array.length] = temp[l];
  }

  return array;
}

// shift([1, 2, 3]);                // [1, 2]
// shift([]);                       // undefined
// shift([[1, 2, 3], 4 ,5]);        // [4, 5]

// unshift([1, 2, 3], 5, 6);        // [5, 6, 1, 2, 3]
// unshift([1, 2, 3]);              // [1, 2, 3]
// unshift([4, 5], [1, 2 ,3]);      // [[1, 2, 3], 4, 5]

var array = [4, 5, 6];
unshift(array, 0, 1, 2, 3);
console.log(array);


