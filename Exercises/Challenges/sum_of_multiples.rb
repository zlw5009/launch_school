class SumOfMultiples
  def initialize(*args)
    @number_set = args.empty? ? [3, 5] : args
  end

  def self.to(range)
    new.to(range)
  end

  def to(range)
    (0...range).select { |number| multiple?(number) }.inject(:+)
  end

private 

  def multiple?(number)
    @number_set.any? { |multiple| number % multiple == 0 }
  end
end
