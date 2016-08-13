# New Calculator

def prompt(msg)
  puts "=> #{msg}"
end

def calculation(num1, num2, operation)
  case 
  when operation.downcase.start_with?('a')
    num1 + num2
  when operation.downcase.start_with?('s')
    num1 - num2
  when operation.downcase.start_with?('m')
    num1 * num2
  when operation.downcase.start_with?('d')
    sprintf('%.2f', (num1.to_f / num2.to_f))
  end
end 


loop do 

  prompt ("Enter the first number:")
  first_num = gets.chomp.to_i

  prompt ("Enter the second number:")
  second_num = gets.chomp.to_i

  prompt ("What operation would you like to do: 
          Add, Subtract, Multiply, Divide?")
  operation = gets.chomp

  answer = calculation(first_num, second_num, operation)

  puts answer

  prompt "Would you like to perform another calculation: Yes or No?"
  another = gets.chomp
  break unless another.downcase.start_with?('y')
end