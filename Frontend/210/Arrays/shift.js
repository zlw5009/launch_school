function shift(ary) {
  var first = ary[0];
  for (var i = 0; i < ary.length; i++) {
    ary[i] = ary[i + 1];
  }

  ary.length = ary.length - 1;
  return first;
}