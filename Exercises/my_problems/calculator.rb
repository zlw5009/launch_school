class Calc
  attr_accessor :operator

  def initialize 
    @first_number = nil
  end

  def plus
    self.operator = :+
    self
  end

  def minus
    self.operator = :-
    self
  end

  def times
    self.operator = :*
    self
  end

  def divided_by
    self.operator = :/
    self
  end

  %i(zero one two three four five six seven eight nine).each_with_index do |number, index|
    define_method(number) do
      if operator
        @first_number.send(operator, index)
      else
        @first_number = index
        self
      end
    end
  end
end

p Calc.new.one.plus.two
# 3
p Calc.new.five.minus.six 
# -1
p Calc.new.seven.times.two
# 14
p Calc.new.nine.divided_by.three
# 3