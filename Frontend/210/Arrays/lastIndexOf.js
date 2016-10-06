function lastIndexOf(ary, value) {
  for (var i = ary.length - 1; i >= 0; i--) {
    if (ary[i] === value) {
      return i;
    }
  }

  return -1;
}