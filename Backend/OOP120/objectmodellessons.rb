1. How do we create an object in Ruby? Give an example of the creation of an object. 
  answer:
  "this is an object" && 5 

  class MyClass
  end

  some_object = MyClass.new

2. What is a module? What is its purpose? How do we use them with our classes? 
  Create a module for the class you created in exercise 1 and include it properly.
  answer:
  A module is a collection of behaviors that can be mixed in with a class. 
  We use them with our classes by using the reserved word include
  module Taste
    def taste(some_taste)
    end
  end

  class MyClass
    include Taste
  end
