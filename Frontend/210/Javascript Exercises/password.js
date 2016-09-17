function verifyPassword() {
  var password = 'password';
  var input;
  var failedAttempts = 0;

  while (input != password && failedAttempts < 3) {
    input = prompt('What is the password:');
    failedAttempts++;
  }

  if (input !== password) {
    alert('You\'ve been denied access');
  } else {
    alert('You\'ve successfully logged in.');
  }
}

verifyPassword();