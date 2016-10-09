// Write a function that will take a short line of text,
// and print it within a box.

// Example:

// printInBox('To boldly go where no one has gone before.'):
// will print on the console:

// +--------------------------------------------+
// |                                            |
// | To boldly go where no one has gone before. |
// |                                            |
// +--------------------------------------------+
// printInBox('')
// +--+
// |  |
// |  |
// |  |
// +--+
// You may assume that the output will always fit in your browser window.

function printInBox(string) {
  console.log('+' + '-'.repeat(string.length + 2) + '+');
  console.log('|' + ' '.repeat(string.length + 2) + '|');
  console.log('| ' + string + ' |');
  console.log('|' + ' '.repeat(string.length + 2) + '|');
  console.log('+' + '-'.repeat(string.length + 2) + '+');
}

printInBox('');
printInBox('This will be printed in a box.');