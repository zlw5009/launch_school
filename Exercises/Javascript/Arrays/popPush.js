// In this exercises, you will implement your onw version of two array methods: 
// Array.prototype.pop() and Array.prototype.push(). pop removes the last element 
// in an array and returns it. If the array is empty when pop is called, 
// it returns undefined. 
// push, on the other hand, adds one or more elements to the end of an array and 
// returns the new length.

function pop(array) {
  var lastElement = array.slice(-1);
  array.splice(-1, 1);

  return lastElement;
}

function push(array) {
  for (var i = 1; i < arguments.length; i++) {
    array[i] = arguments[i];
  }

  return array.length
}

var array = [1, 2, 3]
pop(array);                   // 3
console.log(array)            // [1, 2]
pop([]);                      // undefined
pop([1, 2, ['a', 'b', 'c']]); // [ 'a', 'b', 'c' ]

// var array = [1, 2, 3]
// push(array, 4, 5, 6);         // 6
// console.log(array)            // [1, 2, 3, 4, 5, 6]
// push([1, 2], ['a', 'b']);     // 3
// push([], 1);                  // 1
// push([]);                     // 0