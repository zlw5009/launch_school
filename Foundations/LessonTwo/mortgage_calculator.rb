# mortgage_calculator.rb 
# This program calculates the monthly payments for 
# car and mortgage loans based on the following user inputs
# loan amount, loan duration, and APR

# Pseudo code
# get loan amount from user
# get the APR from the user
# get the loan duration from the user
# subprocess: calculate the monthly payment for loan
# calculate the interest monthly and the monthly principle
# add interest and principle together
# print the monthly payment

# turn the string APR into a float and divide by 100 to get in percentage format
# then divide by 12 to calculate the monthly IR from the APR

# utilize the following formula for the calculation of the monthly payment
# P = L[i(1+i)^n] / [(1+i)^n - 1]
# P = monthly payment; L = loan amount; i = interest rate
# ** is used for exponential calculations

def prompt(msg)
	puts ("=> #{msg}")
end

def two_decimal(num)
	num = sprintf "%.2f", num
end

prompt("Let's calculate your monthly loan payment!")

loop do

	prompt("What is the loan amount?")

	loan_amt = ''
	loop do
		loan_amt = gets.chomp

		if loan_amt.empty? || loan_amt.to_f < 0
			prompt("Must enter positive loan amount.")
		else 
			break
		end
	end


	prompt("What is the Annual Percentage Rate (APR)?")

	apr = ''
	loop do
		apr = gets.chomp

		if apr.empty? || apr.to_f < 0
			prompt("Must enter a positive interest rate.")
		else
			break
		end
	end


	prompt("What is the duration of the loan in months")

	duration = ''
	loop do
		duration = gets.chomp

		if duration.empty? || duration.to_i < 0
			prompt("Enter a valid term in months")
		else
			break
		end
	end

	int_rate = (apr.to_f / 100) / 12

	monthly_payment = ((loan_amt.to_f * (int_rate* (1 + int_rate) ** duration.to_i)) /
										((1 + int_rate) ** duration.to_i - 1))

	prompt("The monthly payment on this loan for #{two_decimal(loan_amt)} at an APR 
				of #{apr}% over #{duration} months is #{two_decimal(monthly_payment)}!")

	prompt("Would you like to calculate another loan: Yes or No?")
	answer = gets.chomp

	break unless answer.downcase.start_with?('y')
end

prompt("Goodbye!")
