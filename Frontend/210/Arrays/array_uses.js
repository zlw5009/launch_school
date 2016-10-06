function firstElementOf(ary) {
  return ary[0];
}

function lastElementOf(ary) {
  return ary[ary.length - 1];
}

function nthElementOf(ary, index) {
  return ary[index];
}

function firstNOF(ary, length) {
  return ary.slice(0, length);
}

function lastNOF(ary, length) {
  if (ary.length >= length) {
    return ary;
  }

  return ary.slice((ary.length - length));
}

function endsOf(beginningAry, endingAry) {
  return [beginningAry[0], endingAry[endingAry.length - 1]];
}

function oddElementsOf(ary) {
  var oddElemets = [];

  for (var i = 1; i < ary.length; i += 2) {
    oddElemets.push(ary[i]);
  }

  return oddElemets;
}

function combinedAry(even, odd) {
  var combined = [];

  for (var i = 0; i < length; i++) {
    combined.push(even[i]);
    combined.push(odd[i]);
  }

  return combined;
}

function mirroredArray(arr) {
  return arr.concat(arr.slice().reverse());
}

function joinArray(arr, seperator) {
  return arr.join(seperator || '');
}

function sortDescending(ary) {
  return ary.sort(function(a, b) { return b - a; });
}

function matrixSums(ary) {
  var result = [];

  for (var i = 0; i < ary.length; i++) {
    result.push(ary[i].reduce(function(a, b) { return a + b }));
  }

  return result;
}

function uniqueElements(ary) {
  var new_array = [];

  for (var i = 0; i < ary.length; i++) {
    if (!new_array.includes(ary[i])) {
      new_array.push(ary[i]);
    }
  }

  return new_array;
}

function missing(ary) {
  var result = [];

  for (var lower = ary[0]; lower < ary[ary.length - 1] ; lower++) {
    if (!ary.includes(lower)) {
      result.push(lower);
    }
  }

  return result;
}

console.log(missing([-3, -2, 1, 5]));

