function unshift(ary, value) {
  for (var i = ary.length; i > 0; i--) {
    ary[i] = ary[i - 1];
  }

  ary[0] = value;
  return ary.length;
}