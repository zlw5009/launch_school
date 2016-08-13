# This program is to calculate the factorial
# of a number by using recursion

	def factorial(n) 
		return 1 if n == 1
		return n * factorial(n-1)
	end

	puts factorial(5)
	puts factorial(6)
	puts factorial(7)
	puts factorial(8)
