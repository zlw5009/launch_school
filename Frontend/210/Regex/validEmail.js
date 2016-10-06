function isValidEmail(email) {
  return Boolean(email.match(/^[a-z0-9]+@[a-z\.]+\.[a-z]+$/));
}