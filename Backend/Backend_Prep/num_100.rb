puts "Enter a number between 0-100:"
number = gets.chomp.to_i

  if (number > 0) && (number < 50)
	  puts "# is greater than zero; less than fifty"
  elsif (number >= 51) && (number <= 100)
	  puts "# is greater than 51; less than 100"
  else 
	  puts "# is greater than 100"
end

puts "Enter a number between 0-100:"
number = gets.chomp.to_i

  case
  when (number > 0) && (number < 50)
	  puts "# is greater than zero; less than fifty"
  when (number >= 51) && (number <= 100)
	  puts "# is greater than 51; less than 100"
  else 
	  puts "# is greater than 100"
end