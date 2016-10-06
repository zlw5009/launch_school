// The slice function takes an array as an argument and two optional indices 
// representing a beginning and end. It returns a shallow copy of a portion of the array.

// The beginning index is zero-based. If provided, it is the index at which extraction 
// will begin. If the beginning index is negative, it indicates that it will extract 
// elements starting from the end. For example, a beginning index of -2 will correspond 
// to the last 2 elements of an array. If the absolute value of a negative beginning index 
// is greater than the lenght, then start at 0. When the beginning index is undefined, 
// the slice function begins from index 0.

// The ending index is zero-based. It indicates up to which index the slice extraction 
// will be done. slice extracts up to but not including the ending index. Similar to the
// beginning index, a negative ending index means that count is taken from the end of the
// array. When the ending index is undefined, slice extracts up to the end of the array.

function slice(array, begin, end) {
  var tempArray = [];

  if (!begin || (begin < 0 && array.length < Math.abs(begin))) {
    begin = 0;
  } else if (begin < 0) {
    begin = array.length + begin;
  }

  if (!end || end > array.length) {
    end = array.length;
  } else if (end < 0) {
    end = array.length + end;
  }

  for (var i = begin; i < end; i++) {
    tempArray[tempArray.length] = array[i];
  }

  console.log(tempArray);
}

slice([1, 2, 3, 4, 5], -4, 9);


