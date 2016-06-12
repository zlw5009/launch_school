# Build an program that displays when the user will retire 
# and how many years they have to work till retirement.

puts "How old are you?"
current_age = gets.chomp.to_i
puts "When would you like to retire?"
retirement_age = gets.chomp.to_i

years_till_retirement = retirement_age - current_age
current_year = Time.now.year
retire_year = current_year + years_till_retirement

puts "It is #{current_year}. You will retire in #{retire_year}."
puts "You still have #{years_till_retirement} years of work left to do."