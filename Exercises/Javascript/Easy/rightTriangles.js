// Write a function that takes a positive integer, n, as an argument,
// and displays a right triangle whose sides each have n stars.
// The hypotenuse of the triangle (the diagonal side in the images below)
// should have one end at the lower-left of the triangle, and the other
// end at the upper-right.

// Examples:

// triangle(5)

//     *
//    **
//   ***
//  ****
// *****

// triangle(9)

//         *
//        **
//       ***
//      ****
//     *****
//    ******
//   *******
//  ********
// *********

// Algorithm:
// - set rows = argument
// - repeat ' ' by rows - row number 
// - followed by '*' repeated for row number

function triangle(rows) {
  var stars = '*';
  var spaces = ' ';

  for (var currentRow = 1; currentRow <= rows; currentRow++) {
    console.log(spaces.repeat(rows - currentRow) + stars.repeat(currentRow));
  }
}

triangle(3);