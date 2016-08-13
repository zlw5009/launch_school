puts "Enter a string"
my_string = gets.chomp

if my_string.length > 10
	puts my_string.upcase
else 
	puts my_string
end
