# Pseudo Code
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

puts "Welcome to the Calculator!"

puts " Whats the first number?"
number1 = gets.chomp.to_i

puts "What's the second number?"
number2 = gets.chomp.to_i

puts "Enter an operation: add, subtract, multiply, divide"
operator = gets.chomp.to_s

if operator == "add"
	answer = number1 + number2
elsif operator == "subtract"
	answer = number1 - number2
elsif operator == "multiply"
	answer = number1 * number2
else
	answer = number1.to_f / number2.to_f
end

puts "The answer = #{answer}!"