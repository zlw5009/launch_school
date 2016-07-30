# "select the element out of the array if its index is a fibonacci number"

# 1. def fibonacci number method which determines if a number is in the fib seq
# 2. take one argument and p it out
# 3. return true if the number = 1
# 4. fibonacci is the sum of the two numbers before it added together
# 5. return true if the number is a fibonacci number
# 6. declare a method to take an array as a parameter then returrn 
# => all the elements in the array that the index is in the fib seq
# 7. iterate over each index within the array
# 8. call the fibonacci method 
# => if true is returned by the fib meth, p the element at that index

def fibonacci?(idx, current = 1, before = 0)
  return true if current == idx || idx == 0
  return false if current > idx
  fibonacci?(idx , current + before, current)
end

def return_fibonacci_index(arr)
  arr.each_index do |idx| 
    if fibonacci?(idx)
      p arr.values_at(idx).join(', ')
    end
  end
end

my_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
# idx = 21
# p fibonacci?(idx)

return_fibonacci_index(my_array)