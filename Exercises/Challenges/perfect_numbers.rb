class PerfectNumber

  def self.divisors(num)
    (1..(num / 2)).select { |number| num % number == 0 }
  end 

  def self.sum_of_divisors(num)
    divisors(num).inject(:+)
  end

  def self.classify(num)
    raise RuntimeError unless num >= 0

    case sum_of_divisors(num) <=> num
    when 1 then 'abundant'
    when 0 then 'perfect'
    when -1 then 'deficient'
    end
  end

end

p PerfectNumber.classify(13)