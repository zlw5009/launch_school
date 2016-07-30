def rotate_array(array)
  array[1..-1] + [array[0]] 
end

def rotate_rightmost_digits(number, x)
  rotation = number.to_s.chars
  rotation[-x..-1] = rotate_array(rotation[-x..-1])
  rotation.join.to_i
end

p rotate_rightmost_digits(735291, 3) == 735912


# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]   