require 'pry'
arr = [1, 2, 3, 4, 5]

def reverse_array(arr)
  new_arr = []
  arr.length.times do
    new_arr << arr.unshift(arr.last).pop
    binding.pry
  end
  puts new_arr.join(", ")
end

reverse_array(arr)