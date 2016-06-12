# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and the total amount of the bill.

puts "What is the bill?"
bill = gets.chomp.to_f
puts "What % would you like to tip?"
percent = gets.chomp.to_f

tip = bill * (percent / 100)
tot_bill = bill + tip

puts "The tip is: $#{sprintf('%.2f', tip)}"
puts "Your total bill is: $#{sprintf('%.2f', tot_bill)}"