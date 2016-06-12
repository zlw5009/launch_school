# When we called the go_fast method from an instance of the Car class 
# (as shown below) you might have noticed that the string printed when 
# we go fast includes the name of the type of vehicle we are using. 
# How is this done?

This is done through several factors. First, the module has defined the method
go_fast. Then we mixed in that module with the Vehicle classes giving us access 
to the go_fast method. The object then calls the go_fast method. 

The reason self.class works is because we are calling self on the object that called
go_fast and asking it to tell us which class the object is in. 