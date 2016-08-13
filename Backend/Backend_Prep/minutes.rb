/calculates how many seconds are in a year/
seconds_per_year = (365*24)*(60*60)
/calcuates how many seconds are in a month/
seconds_per_month = seconds_per_year / 12
/calculates how many seconds are in a day/
seconds_per_day = seconds_per_month / 30
/calculates how many seconds I have lived/
myLifeInSeconds = (24 * seconds_per_year) + (seconds_per_month * 4 + (seconds_per_day * 12) )
puts myLifeInSeconds
