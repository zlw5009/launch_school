# Now, lets say that we want to evaluate 2, 3, or 1,000 arrays and check how many times an element
# appears in each array and store those values in a hash. In otherwords, we want one hash that will 
# store all the array elements and the # of times they repeat in a nested hash. We want to be able to
# reference each array from the hash and output the associated information from the hash. 

# The objective is to iterate through any array, count the elements, and store them in a nested hash. 

# # Logic:
# 1. Take an array and pass each element into a block
# 2. Evaluate the number of times an element appears in an array
# 3. Store the element as the key and the # of times the element appears as the values
# 4. Set the variable name of the array evaluated as the key and the hash of element/values as the value.

some_array = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
another_array = ['dog', 'cat', 'cat', 'squirrel', 'mouse', 'rabbit', 'rabbit', 'dog']
final_array = ['jeans', 'shirts', 'hats', 'shirts', 'jeans', 'jeans', 'underwear', 'hats', 'sweatshirts']

def element_storage(some_array)
  master_hash = {}
  some_array.uniq.each do |element|
    master_hash[some_array] = {new_hash[element] => some_array.count(element)}
  end
end