# This program will capitalize the first letter in each word of a sentence or string

# get the string 
# def a method that will map through a string
# if it comes across a space char 
# the char immediately after the space should be capitalized

def titleize(string)
  string.split.map {|string| string.capitalize}.join(' ')
end

my_string = "this is my string"

puts titleize(my_string)