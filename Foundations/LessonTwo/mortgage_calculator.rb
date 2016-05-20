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

puts "What is the loan amount"
loan_amt = gets.chomp

puts "What is the APR on the loan"
apr = gets.chomp

puts "what is the duration of the loan in months"
duration = gets.chomp

# turn the string interest rate into a float and divide by 100

apr = apr.to_f / 100

monthly_payment = (loan_amt.to_f * (apr * (1+apr) ** duration.to_i))
monthly_payment = monthly_payment / ((1+apr) ** duration.to_i - 1)
puts monthly_payment.round(2)
# utilize the following formula for the calculation of the monthly payment
# P = L[i(1+i)^n] / [(1+i)^n - 1]
# P = monthly payment; L = loan amount; i = interest rate
# ** is used for exponential calculations

