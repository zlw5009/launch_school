# class GoodDog
#   DOG_YEARS = 7 # => constant variable
#   @@num_of_dogs = 0 # => class variable

#   attr_accessor :name, :height, :weight, :age # => used as a getter and setter method. 

#   def initialize(n, h, w, a)
#     self.name = name
#     self.height = h
#     self.weight = w
#     self.age = a * DOG_YEARS
#     @@num_of_dogs += 1
#   end

#   def self.total_number_of_dogs
#     @@num_of_dogs
#   end

#   def speak
#     "#{name} says Arf!" # => changed from #{@name} which is referencing the instance method not the instance variable: usable by attr_accessor
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall!"
#   end

#   def self.what_am_i # => Class method definition
#     "I'm a GoodDog class!"
#   end

# end

# # => GoodDog.what_am_i # => I'm a GoodDog class!

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, make, color)
    @year = year
    @model = make
    @color = color
    @current_speed = 0
  end

  def speedup(number)
    @current_speed += number
  end

  def brake(number)
    @current_speed -= number
  end

  def current_speed
    puts "You're now going #{@current_speed}"
  end

  def shutoff
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def display_info
    puts "Your car is a #{@year} #{@model} and the color of it is #{@color}."
  end

  def spray_paint(color)
    self.color = color
    puts "You changed the color of your car to #{color}."
  end

  def self.calc_gas_milage(gallons, miles)
    puts "Your car gets #{miles / gallons} mpg."
  end

  def to_s
    puts "My #{@model} is #{color}!"
  end
end

sierra = MyCar.new('2016', 'GMC Sierra', 'Blue')
sierra.display_info
MyCar.calc_gas_milage(25, 460)
sierra.to_s

# 3. Because we only have a getter method for name with attr_reader. If we want to reassign name
# => we need to either change name to a setter method by using attr_writer or a getter/setter
# => combo by using attr_accessor. 




