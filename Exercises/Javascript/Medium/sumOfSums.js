// Write a function that takes an Array of numbers and then returns the sum
// of the sums of each leading subsequence for that Array. You may assume that
// the Array always contains at least one number.

// Examples:

// sumOfSums([3, 5, 2])       // (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
// sumOfSums([1, 5, 7, 3])    // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
// sumOfSums([4])             // 4
// sumOfSums([1, 2, 3, 4, 5]) // 35

function sumOfSums(numbers) {
  return numbers.reduce(function(sum, num, index) {
    return sum + numbers.slice(0, index+1).reduce((sum, num) => sum + num);
  });
}

console.log(sumOfSums([1, 2, 3, 4, 5]));
