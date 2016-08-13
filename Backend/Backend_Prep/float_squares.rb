# This program take the input from the user
# and turns it into a float 
# then calculates the square of the float

	def float_squared(f) 
		return f * f
	end

puts "Enter a number (ex. 1, 168, 1.24, 4.52624): "
f = gets().to_f
puts "The number you entered #{f} squared = " 
puts float_squared(f)