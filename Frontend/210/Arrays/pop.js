function pop(ary) {
  var value = ary[ary.length - 1];
  ary.length = ary.length - 2;
  return value;
}