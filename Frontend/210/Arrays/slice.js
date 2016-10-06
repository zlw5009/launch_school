function slice(ary, start, stop) {
  var = new_ary;

  for (var i = start; i < stop; i++) {
    new_ary += ary[i];
  }

  return new_ary;
}