function myFilter(array, func) {
  var result = [];

  array.forEach(function(value) {
    if (func(value)) {
      result.push(value);
    }
  });
}