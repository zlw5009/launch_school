// Write a function that takes a string argument and returns a new 
// string that contains the value of the original string with all 
// consecutive duplicate characters collapsed into a single character.

// Examples:

// crunch('ddaaiillyy ddoouubbllee');        // 'daily double'
// crunch('4444abcabccba');                  // '4abcabcba'
// crunch('ggggggggggggggg');                // 'g'
// crunch('a');                              // 'a'
// crunch('');                               // ''

function crunch(string) {
  var crunched = '';

  for (var i = 0; i < string.length; i++) {
    string[i] !== string[i+1] ? crunched += string[i] : crunched;
  }  

  return crunched;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));        // 'daily double'
console.log(crunch('4444abcabccba'));                  // '4abcabcba'
