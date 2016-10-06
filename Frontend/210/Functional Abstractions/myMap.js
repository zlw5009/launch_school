function myMap(array, func) {
  var result = [];

  array.forEach(function(value) {
    result.push(func(value);
  });

  return result;
}