require 'pry'

array = [1,2,3,4,5]

def reduce(array, accumulator = 0)

  array.each do |element|
    accumulator = yield(accumulator, element)
  end

  accumulator
end

reduce(array) { |acc, num| acc + num }