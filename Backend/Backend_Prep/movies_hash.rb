# this program uses a hash to record a movie
# and the year it came out via key => value pairs

movies = {
	:deadpool => '2016',
	:superman_vs_batman => '2016',
	:friday_night_lights => '2004',
	:varsity_blues => '1999'
}

# puts movies.values

/ takes the values from the movies hash 
and puts them into an array /

movie_dates = Array.new(movies.values)

puts movie_dates