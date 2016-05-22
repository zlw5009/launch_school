def descending_order(digits)
  digits.to_s.split(//).sort { |y,z| z <=> y }.join.to_i
end

puts descending_order(8827591018508124710)