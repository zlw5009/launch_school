# set method name 
# set integer array = several inputs of integers
# declare new variable for new array with every other element
# print the new array

def every_other
	ints_arr = [2, 3, 5, 13, 20, 32, 69, 54]
	other_ints = ints_arr.delete_if.each_index { |x| if x % 2 == 0 }
end

every_other
