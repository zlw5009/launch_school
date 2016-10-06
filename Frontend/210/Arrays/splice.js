function splice(ary, start, number) {
  var removedValues = [];

  for (var i = start; i < array.length; i++) {
    if (i < begin + number) {
      push(removedValues, array[i]);
    }

    array[i] = array[i + number];
  }

  array.length = array.length = number;
  return removedValues;
}