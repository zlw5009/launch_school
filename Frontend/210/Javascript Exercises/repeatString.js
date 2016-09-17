function repeat(string, times) {
  var result = '';

  if (times < 0 || times === NaN) {
    return undefined;
  }

  for (var i = 0; i < times; i++) {
    result += string;
  }

  return result;
}

console.log(repeat('abc', 1));