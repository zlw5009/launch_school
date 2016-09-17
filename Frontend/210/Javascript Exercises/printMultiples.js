function printMultiple(number) {
  for (var i = 100; i >= number; i--) {
    if (i % 2 === 1 && i % number === 0) {
      console.log(i);
    }
  }
}

printMultiple(21);