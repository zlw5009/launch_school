function arraysEqual(ary1, ary2) {
  if (ary1.length !== ary2.length) {
    return false;
  }

  for (var i = 0; i < ary1.length; i++) {
    if (ary1[i] !== ary2[i]) {
      return false;
    }
  }

  return true;
}