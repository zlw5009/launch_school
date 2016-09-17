# Write a method that computes the sum of all numbers between 1 and some 
# other number that are a multiple of 3 or 5. For instance, if the supplied 
# number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Examples

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

def multisum(number)
  (1..number).select { |multiple| multiple % 3 == 0 || multiple % 5 == 0 }.inject(:+)
end

p multisum(20)