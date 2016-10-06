function acronym(string) {
  var wordsArray = string.replace(/-/g, ' ').split(' ');
  var initials = wordsArray.map(function(word) {
    return word[0].toUpperCase();
  })

  return initials.join('');
}

acronym("Hyper-text Markup Language");