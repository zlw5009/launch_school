# The objective is to take an array of elements and find out how many times each element appears 
# in the associated array. We want to store (via a hash) the element and the # of times it 
# is present in a new array. 

# Logic:
# 1. Take an array of elements and iterate through the array
# 2. Count how many times an element appears in the array
# 3. Store the element and number of times it appears in a hash => (key = 'element', value = integer)

some_array = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
# We want the hash to look like this:
# new_hash = {'car' => 4, 'truck' => 3, 'SUV' => 1, 'motorcycle' => 2}

# Create the hash so we can store our results into it
new_hash = {}

# Iterate through the array passing each element in the block
# => The block will evaluate the elements and count how many elements there are
some_array.uniq.each do |element|
  # Stores the each element and number of times it appears in a nested array
  new_hash[element] = some_array.count(element)
  # Eliminates the repeated elements of the new array. 
end

# If we call `puts new_hash`, we will see that we get our expected output from line 12. 

# Then we can print to the terminal what each element is and how many times it appears

new_hash.each do |key, value|
  puts "The #{key} shows up #{value} times in the array."
end

# Explanation:
# We are calling `uniq` on `some_array` so that as we iterate through the array
# we aren't going to add `'car'`, `'truck'`, etc. multiple times into the 
# `new_hash`. `each` is called on the `some_array` so that we can iterate 
# through the array for each element of self and will pass each element of `some_array`
# into the block. The block, represented by `new_hash[element] = some_array.count(element)`
# is performing a few tasks. Primarily, it is going to assign an integer value to 
# the element key. In otherwords, `new_hash[element]` is going to be the key `{'car'=>4...}`
# and `4` is going to be the value assigned by `some_array.count(element)`. 

# Why the hash data structure is a better fit solution for this circumstance compared to the array solution:

# In both of these examples, we want to be able to associate the element of the array with how many times
# it appears in `some_array`. If we reflect back to Hashes vs. Arrays in the Introduction to Programming 
# with Ruby Book (https://launchschool.com/books/ruby/read/hashes#hashesvsarrays), we can see that when data
# needs to be associated with a specific label, a hash is the most appropriate data structure to use. In this 
# case, how many times an element appears should be associated with the specific element label. 
