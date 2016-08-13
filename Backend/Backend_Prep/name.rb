# this program gets the users name 
# then repeats it back to the user

#def greeting
#	puts "What is your first name?" 
#	first_name = gets.chomp
#	puts "What is your last name?"
#	last_name = gets.chomp
#	puts "Hello #{first_name} #{last_name}!"
#end 

#greeting


def greeting(name)
	"Hello, " + name + "!"
end

puts greeting("Bob")

