require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Pseudo Code
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# Better integer validation for '0'
# get input from the user
# if the input is not a number
# it is not a valid input
# compare the input to itself after turning it
# into an integer then back into a string


def prompt(message)
	puts("=> #{message}")
end

def integer?(input)
	input.to_i.to_s == input
	input.to_i
end

def float?(input)
	input.to_f.to_s == input
	input.to_f
end

def number?(input)
	integer?(input) || float?(input)
end 


prompt(MESSAGES['welcome'])

name = ''

loop do
	name = gets.chomp

	if name.empty?
		prompt(MESSAGES['valid_name'])
	else
		break
	end
end

prompt(MESSAGES['greeting'] + "#{name} :)")

loop do # main loop
	number1 = ''

	loop do
		prompt(MESSAGES['first_num'])
		number1 = gets.chomp.to_i

		if number?(number1)
			break
		else 
			prompt(MESSAGES['valid_number'])
		end
	end

	number2 = ''

	loop do
		prompt(MESSAGES['second_num'])
		number2 = gets.chomp.to_i

		if number?(number2)
			break
		else
			prompt(MESSAGES['valid_number'])
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
			prompt(MESSAGES['valid_operator'])
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


	prompt(MESSAGES['answer'] + "#{answer}!")

	prompt(MESSAGES['another_calc'])
	another_calc = gets.chomp
	break unless another_calc.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'] + "#{name}! Goodbye!!")
