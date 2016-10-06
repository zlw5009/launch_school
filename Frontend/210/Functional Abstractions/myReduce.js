function myReduce(array, func, inital) {
  var value, index;

  if (initial) {
    value = initial;
    index = 0;
  } else {
    value = array[0];
    index = 1;
  }

  array.slice(index).forEach(function(element) {
    value = func(value, element);
  });

  return value;
}