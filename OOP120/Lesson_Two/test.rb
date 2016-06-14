require 'pry'

losses = ['rock', 'rock', 'paper', 'spock', 'rock']

count_losses = Hash.new(0)

losses.each do |v|
  count_losses[v] += 1
end

count_losses.each_value do |v|
 
   if (v.to_f / losses.count) > 0.5
    puts count_losses.key(v)
  end
end
