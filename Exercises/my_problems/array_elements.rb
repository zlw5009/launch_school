# The objective is to take an array of elements and find out how many times each element appears 
# in the associated array. We want to store via a nested array the element and the # of times it 
# is present in a new array. 

# Logic:
# 1. Take an array of elements and iterate through the array
# 2. Count how many times an element appears in the array
# 3. Store the element and number of times it appears in a nested array

some_array = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
# We want the new array to look like this:
# new_array = [['car', 4], ['truck', 3], ['SUV', 1], ['motorcycle', 2]]

# Create the new array so we can store our results into it
new_array = []

# Iterate through the array passing each element in the block
# => The block will evaluate the elements and count how many elements there are
some_array.uniq.each do |element|
  # Stores the each element and number of times it appears in a nested array
  new_array << [element, some_array.count(element)]
  # Eliminates the repeated elements of the new array. 
end

# If we calls `p new_array`, we will see that we get our expected output on line 12. 

# Then we can print to the terminal what each element is and how many times it appears

new_array.each do |elements|
  puts "The #{elements[0]} shows up #{elements[1]} times in the array."
end

# Explanation:
# We are calling `uniq` on `some_array` so that as we iterate through the array
# we aren't going to add `'car'`, `'truck'`, etc. multiple times into the 
# `new_array`. `each` is called on the `some_array` so that we can iterate 
# through the array for each element of self and will pass each element of `some_array`
# into the block. The block, represented by `new_array << [element, some_array.count(element)]`
# is performing a few tasks. Primarily, it is going to append a nested array into the 
# `new_array` array. `some_array.count(element)` is going to count how many times `element` 
# appears in the `some_array` and return an integer. 