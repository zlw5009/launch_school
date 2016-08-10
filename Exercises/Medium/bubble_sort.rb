# Write a method that takes an Array as an argument, 
# and sorts that Array using the bubble sort algorithm as just described. 
# Note that your sort will be "in-place"; that is, 
# you will mutate the Array passed as an argument. 
# You may assume that the Array contains at least 2 elements.

require 'pry'

def bubble_sort!(ary)
  ary.size.times do
    ary.each_with_index do |element, index|
      break if ary[index+1] == nil
      if ary[index+1] < element
        ary[index], ary[index+1] = ary[index+1], element
      end
    end
  end
  nil
end

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
