# take a word and determine if it is a palindrome without using 
# the reverse method

# 1. def a method that will take a string arguement
# 2. take each character of the word and put it into an array
# 3. if the word flipped is == to the word unflipped, it is a palindrome
# 4. otherwise, return false.
# 5. were looking for a boolean value to be returned by the method
# 6. we will flip the word by flipping each character 
#   by moving the last character to the front 
require 'pry'

word = "zach"

def palindrome?(str)
  test_pal = []
  test_array = str.chars
  test_array.length.times do 
    test_pal << test_array.unshift(test_pal.last).pop
  end
  p "true" if test_pal.join("").to_s == str.downcase
end

palindrome?(word)