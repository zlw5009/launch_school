# Write a method that takes one argument, a positive integer, 
# and returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

def stringy(int)
  stringy = ''
  (int / 2).times do
    stringy << '10'
  end 

  if int % 2 != 0
    stringy << '1'
  end

  stringy
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'