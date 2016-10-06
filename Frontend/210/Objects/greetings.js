function greetings(name, status) {
  var nameGreeting = 'Hello ' + name.join(' ') + '!';
  var statusGreeting = 'Nice to have a ' + status.title + ' ' + status.occupation + ' around.';
  
  console.log(nameGreeting + ' ' + statusGreeting);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })