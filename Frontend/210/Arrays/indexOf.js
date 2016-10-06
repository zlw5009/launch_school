function indexOf(ary, value) {
  for (var i = 0; i < ary.length; i++) {
    if (ary[i] === value) {
      return i;
    }
  }

  return -1;
}