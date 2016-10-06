function totalArea(array) {
  var result = array.map(function(rectangle) {
    return rectangle[0] * rectangle[1];
  });

  return result.reduce( (prev, curr) => prev + curr );
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));

function totalSquareArea(array) {
  var squares = array.filter(function(rectangle) {
    return rectangle[0] === rectangle[1];
  });

  return totalArea(squares);
}

console.log(totalSquareArea(rectangles));