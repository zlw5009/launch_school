# takes a string and reverses the order of the words

sentence = "Humpty Dumpty sat on a wall."

# puts sentence.split.reverse.join(' ')

words = sentence.split(/\W/)
reverse_sentence = words.reverse!.join(' ') + '.'


puts reverse_sentence