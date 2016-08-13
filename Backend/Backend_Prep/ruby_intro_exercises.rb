array = [1,2,3,4,5,6,7,8,9,10]

# Exercise #1
array.each { |num| puts num }

# Exercise #2
array.each { |num| puts num if num > 5 }

# Exercise #3
odd_array = array.select { |num| num % 2 != 0}
puts odd_array

# Exercise #4
array.push(11).unshift(0) 
puts array

# Exercise #5
array.pop
array << 3
puts array

# Exercise #6
array.uniq!
puts array

# Exercise #7 - 
# A hash provides a key:value pair 
# that could not be ordered until recently with a 
# new version of Ruby which is referenced by the key. 
# An array allows a user to input data into an ordered structure.
# A hash should be used when associating a key:value pair. 

# Exercise #8
old_hash = {:my_name => 'Zach'}
new_hash = {my_name: 'Zach'}

# Exercise #9

h = {a:1, b:2, c:3, d:4}

h(:b)
h{e:5}
h.delete_if {|k,v| v < 3.5 }

# Exercise #10
# Yes - an array can be made up of hashes and hashes can have an array of values. 

# Exercise #11
# Obviously, for Rails, the api.rubyonrails.org API source comes at the top of the 
# list because it is the main documentation for rails which includes all the stepping 
# stones and more to become an efficient and effective rails developer.
# As for Ruby, three sources come to mind. Ruby-lang.org, ruby-doc.org, and ruby-toolbox.com.
# Each of these three sources provide great references to any and all things Ruby. 

# Exercise #12
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts = ["Joe Smith"][:email] = contact_data[0][0]
contacts = ["Joe Smith"][:address] = contact_data[0][1]
contacts = ["Joe Smith"][:phone] = contact_data[0][2]
contacts = ["Sally Johnson"][:email] = contact_data[1][0]
contacts = ["Sally Johnson"][:address] = contact_data[1][1]
contacts = ["Sally Johnson"][:phone] = contact_data[1][2]

# Exercise #13

puts contacts["Joe Smith"].values_at(:email)
puts contacts["Sally Johnson"].values_at(:phone)

# Exercise #14

category = [:email, :address, :phone]

contacts.each do |name, hash|
  category.each do |entry|
    hash[entry] = contact_data.shift
  end
end

# Exercise #15

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|str| str.starts_with?('s')}

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|str| str.starts_with?('s, w')}

# Exercise #16

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

b = a.collect {|phrase| phrase.split}
# or 
b = a.flatten

# Exercise #17
# The program will output "These hashes are the same!" 
# because hash 1 and 2 have the same key:value pairs
# only in a different order and utilizing the old method
# for hash2 and the new method for hash1.

