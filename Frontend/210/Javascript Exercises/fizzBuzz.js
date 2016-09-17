function fizzBuzz() {
  var message;

  for (var i = 1; i <= 100; i++) {
    message = '';
    if (i % 3 === 0) {
      message += 'Fizz';
    }

    if (i % 5 === 0) {
      message += 'Buzz';
    }

    console.log(message || i);
  }
}

fizzBuzz();