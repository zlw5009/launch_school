def array_diff(array_one, array_two)
  array_one.delete_if { |x| array_two.include?(x) }
  puts array_one
  array_two.delete_if { |x| array_one.include?(x) }
  puts array_two
end

arr = [1,2,3,4,5,6]
brr = [3,5,6,7,8,9]

puts array_diff(arr, brr)