// Given a string that consists of some words and an assortment of non-alphabetic 
// characters, write a function that returns that string with all of the 
// non-alphabetic characters replaced by spaces. If one or more non-alphabetic 
// characters occur in a row, you should only have one space in the result 
// (the result should never have consecutive spaces).

// Examples:

// cleanUp('---what\'s my +*& line?');      // ' what s my line '

function cleanUp(string) {
  var newString = string.replace(/[^a-z]/gi, ' ').replace(/\s+/g, ' ');

  return newString;
}

cleanUp('---what\'s my +*& line?');      // ' what s my line '
