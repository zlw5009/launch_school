require 'pry'

class Fixnum

  def equivalent(number)
    case number
    when 1..3
      'I' * number
    when 4        then 'IV'
    when 5..8
      'V' + (number - 5)
    when 9        then 'IX'
    when 10..13   then 'X'
    when 14       then 'XIV'
    when 50..80   then 'L'
    when 100..300 then 'C'
    when 400      then 'CD'
    when 500..800 then 'D'
    when 900      then 'DM'
    when 1000     then 'M'
    end
  end

  def to_roman
    result = ''
    romans = separator
    binding.pry
    if romans.size == 1
      result = equivalent(romans[0])
    elsif romans.size == 2
      result = equivalent((romans[0] * 10)) + equivalent(romans[0])
    end

    result
  end

  def separator
    # pass in the number and separate it down into 1000, 100, 10, 1 notation
    num_array = []
    to_s.each_char { |x| num_array << x.to_i }
    num_array
  end
end

12.to_roman