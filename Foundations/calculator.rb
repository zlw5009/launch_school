# Pseudo Code
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
	puts("=> #{message}")
end


prompt("Welcome to the Calculator!")

prompt("Whats the first number?")
number1 = gets.chomp.to_i

prompt("What's the second number?")
number2 = gets.chomp.to_i

prompt("Enter an operation: add, subtract, multiply, divide")
operator = gets.chomp.to_s

answer = case operator
	when "add"
		number1 + number2
	when "subtract"
		number1 - number2
	when "multiply"
		number1 * number2
	when "divide"
		number1.to_f / number2.to_f
	end


prompt("The answer = #{answer}!")