# # class Animal
# #   def speak
# #     "Hello!"
# #   end
# # end

# # class GoodDog < Animal
# #   def speak
# #     super + " from GoodDog class"
# #   end
# # end

# # class Cat < Animal
# # end

# # sparky = GoodDog.new
# # paws = Cat.new
# # puts sparky.speak # => Hello! from GoodDog class
# # puts paws.speak # => Hello!

# module Towable
#   def can_tow?(pounds)
#     pounds < 2000 ? true : false
#   end
# end

# class Vehicle
#   attr_accessor :color
#   attr_reader :year
#   attr_reader :model

#   @@num_vehicles = 0

#   def self.total_num_vehicles
#     puts "We've created #{@@num_vehicles} vehicles with this superclass!!"
#   end

#   def self.calc_gas_milage(gallons, miles)
#     puts "Your car gets #{miles / gallons} mpg."
#   end

#   def initialize(year, make, color)
#     @year = year
#     @model = make
#     @color = color
#     @current_speed = 0
#     @@num_vehicles += 1
#   end

#     def speedup(number)
#     @current_speed += number
#   end

#     def brake(number)
#     @current_speed -= number
#   end

#   def current_speed
#     puts "You're now going #{@current_speed}"
#   end

#   def shutoff
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def display_info
#     puts "Your car is a #{@year} #{@model} and the color of it is #{@color}."
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "You changed the color of your car to #{color}."
#   end

#   def to_s
#     puts "My #{model} is #{color}!"
#   end

#   def age
#     "Your #{self.model} is #{years_old} years old."
#   end

#   private

#   def years_old
#     Time.now.year - self.year
#   end
# end

# class MyCar < Vehicle
#   DRIVETRAIN = 'manual'
# end

# class MyTruck < Vehicle
#   include Towable

#   DRIVETRAIN = 'automatic'
# end

# car = MyCar.new(2011, 'Ford Mustang', 'Orange')
# # car.speedup(45)
# # car.current_speed
# # car.brake(15)
# # car.current_speed
# # car.shutoff
# # MyCar.calc_gas_milage(16, 562)
# # car.spray_paint('White')
# # puts car.to_s
# truck = MyTruck.new(2016, 'GMC Sierra', 'Blue')

# puts car.age
# puts truck.age

# # car.to_s
# # truck.to_s

# # puts Vehicle.total_num_vehicles
# # puts truck.can_tow?(1500)

# # puts "-------Method Hierarchy-------"
# # puts MyCar.ancestors
# # puts MyTruck.ancestors
# # puts Vehicle.ancestors

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end

end

andy = Student.new('Andy', 89)
paul = Student.new('Paul', 64)

puts andy.better_grade_than?(paul)

# => 8. The error message is called because the hi method is private and unaccessible outside 
# =>  the class Person. To fix this, you would need to move the method above the private call 
# =>  or call public before the method definition. 
