# This program allows you to assign monthly payments
# to their respective bills and will automatically
# calculate how much disposable income you have
# after your bills are paid

#Creates the bills hash
bills_hash = {}

# Prompts user to see if they have any bills to enter
puts "Do you have any bills you would like to enter, Yes or No?"
new_bill = gets.chomp.downcase
	until new_bill != 'yes' 

# Gathers key/value pair information for the hash
# of the bill name and the respection payment amount
		puts "Enter the bill name: "
		bill_name = gets.chomp.capitalize # gets the bill name
		puts "How much is this bill?"
		pay_amt = gets.chomp.to_f # gets the amount of the bill

		bills_hash[bill_name] = pay_amt # stores bills in hash

		puts "Would you like to add another bill, Yes or No?"
		new_bill = gets.chomp.downcase
	end

# Displays the users bills
bills_hash.each {|key,value| puts "Your #{key} bill is $#{value}."}
# Calculates the total of all the bills
tot_bills = bills_hash.values.inject { |a,b| a+b }
puts "The total of all your bills = $#{tot_bills}"
 
# Get users net income
puts "What is your net income?"
net_income = gets.chomp.to_f

#Calculates the disposable income of the user
disposable_income = net_income - tot_bills

puts "Your disposable income after all your bills are paid = $#{disposable_income}"
