# Part 1

# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# (A palindrome reads the same forwards and backwards.) Case matters, and all characters should be considered.

def palindrome?(string)
  string == string.reverse
end

# Part 2

# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 
# If you wish, you may simplify things by calling the palindrome? method you wrote in the previous exercise.

def palindrome_alpha?(string)
  formatted = string.downcase.gsub(/[^a-z0-9]/, '')

  palindrome?(formatted)
end

# Part 3

# Write a method that returns true if its integer argument is palindromic, false otherwise. 
# A palindromic number reads the same forwards and backwards.

def palindromic_number?(number)
  palindrome?(number.to_s)
end
