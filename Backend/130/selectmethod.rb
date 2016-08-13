def select(array)
  new_array = []

  array.each do |element|
    new_array << element if yield(element)
  end
  
  new_array
end

select([1, 2, 3, 4, 5, 6]) {|num| num.odd?}