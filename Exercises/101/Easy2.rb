# Build a program that asks a user for the length and width of a room 
# in meters and then displays the area the of the room in both square 
# meters and square feet.

# Note: 1 square yard == 10.7639 square feet
SQFT_CONVERSION = 10.7639

puts "What is the length of the room?"
length = gets.chomp.to_f

puts "What is the width of the room?"
width = gets.chomp.to_f



area_meters = (length * width).round(2)
area_sqft = (area_meters * SQFT_CONVERSION).round(2)

puts "The area in meters is: #{area_meters}."
puts "The area in square feet is: #{area_sqft}."
