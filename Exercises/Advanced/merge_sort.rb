# Sort an array of passed in values using merge sort. 
# You can assume that this array may contain only one type of data. 
# And that data may be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking down 
# the array elements into nested sub-arrays, then recombining those 
# nested sub-arrays in sorted order. It is best shown by example. 
# For instance, let's merge sort the array [9,5,7,1]. 
# Breaking this down into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]

# We then work our way back to a flat array by merging each pair of nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]

def merge(ary1, ary2)
  merge = ary1 + ary2
  result = []

  merge.size.times do
    result << merge.delete_at(merge.index(merge.min))
  end
  
  result
end

def merge_sory(ary)
  return ary if ary.size == 1

  sub_ary1 = ary[0..ary.size / 2 - 1]
  sub_ary2 = ary[ary.size / 2..ary.size]

  sub_ary1 = merge_sort(sub_ary1)
  sub_ary2 = merge_sory(sub_ary2)

  merge(sub_ary1, sub_ary2)
end

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
