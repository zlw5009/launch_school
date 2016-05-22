#Each UUID consists of 32 hexadecimal characters, 
# and is typically broken into 5 sections like this 
# 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# 0..9.to_a and a..f.to_a
# set a constant for the array of characters
# def a method to get random characters
# def a method for the uuid 
# uuid method will call the rand_characters method and cycle 
# through the sections of the uuid then display the return

CHARACTERS = (0..9).to_a.concat(('a'..'f').to_a)
SECTIONS = [8, 4, 4, 4, 12]

def random_characters(times)
  CHARACTERS.sample(times).join
end

def uuid
  SECTIONS.map {|times| random_characters(times) }.join('-')
end

puts uuid