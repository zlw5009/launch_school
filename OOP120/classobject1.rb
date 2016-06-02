# Initializing a New Object

# class GoodDog
#   def initialize
#     puts "This object was initialized"
#   end
# end

# sparky = GoodDog.net # => "This object was initialized"

# Creating a new object and instantiate it with some state, like a name.

# class GoodDog

#   attr_accessor :name, :height, :weight # => used as a getter and setter method. 

#   def initialize(n, h, w)
#     @name = name
#     @height = h
#     @weight = w
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

# end

# Creat a new object using the GoodDog class

# ruger = GoodDog.new("Ruger")
#   # - "Ruger" is being passed from the new method through to the initialize method
#   # and is assigned to the local variable name. Within the constructor (initialize method),
#   # we then set the instance variable `@name` to `name`, which result in assigning 
#   # the string "Ruger" to the `@name` instance variable. 

# p ruger.speak # => "Ruger says Arf!"
# beau = GoodDog.new("Beau")
# p beau.speak # => "Beau says Arf!"
# p ruger.get_name
# p beau.get_name

# beau.set_name = "Bocephus"
# p beau.get_name

# # => utilizing the new change_info method
# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# p sparky.info

# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# sparky.info

# Exercises

# 1. Create a class called MyCar. When you initialize a new instance or object of the class, 
# allow the user to define some instance variables that tell us the year, color, and model of 
# the car. Create an instance variable that is set to 0 during instantiation of the object to 
# track the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.

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
end

sierra = MyCar.new(2016, 'GMC Sierra', 'Blue')
sierra.display_info
sierra.speedup(20)
sierra.current_speed
sierra.speedup(45)
sierra.current_speed
sierra.brake(8)
sierra.current_speed
sierra.shutoff
sierra.current_speed
sierra.color = 'Green'
sierra.display_info
puts sierra.year
puts sierra.color
sierra.spray_paint('Black')


