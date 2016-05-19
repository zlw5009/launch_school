# Pseudo Code
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
	puts("=> #{message}")
end

def valid_number?(num)
	num.to_i != 0
end


prompt("Welcome to the Calculator! Enter your name:")

name = ''

loop do
	name = gets.chomp

	if name.empty?
		prompt("Make sure you enter a valid name.")
	else 
		break
	end
end

prompt("Hi #{name}")

loop do # main loop
	number1 = ''

	loop do
		prompt("Whats the first number?")
		number1 = gets.chomp.to_i

		if valid_number?(number1)
			break
		else 
			prompt("That doesn't look like a valid number!")
		end
	end

	number2 = ''

	loop do
		prompt("What's the second number?")
		number2 = gets.chomp.to_i

		if valid_number?(number2)
			break
		else
			prompt("That's not a valid number, please try again!")
		end
	end 

	operator_prompt = <<-MSG
		What operation would you like to perform?
		Add
		Subtract
		Multiply
		Divide
	MSG

	prompt(operator_prompt)

	operator = '' 
	loop do
		operator = gets.chomp.to_s.downcase

		if %w(add subtract multiply divide).include?(operator)
			break
		else 
			prompt("Must choose a valid operation for the calculator to perform")
		end
	end

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

	prompt("Would you like to perform another calculation, Yes or No?")
	another_calc = gets.chomp
			break unless another_calc.downcase.start_with?('y')
			end

prompt("Thanks for using our calculator, #{name}! Goodbye.")
