# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. 
# The array will never be empty and the numbers will always be positive integers.

# Examples:
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

def average(ary)
  (ary.reduce(:+) / ary.count).to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52]) == 40