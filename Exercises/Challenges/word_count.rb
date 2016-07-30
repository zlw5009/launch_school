# Word Count Challenge 

# Write a program that given a phrase can count the occurrences of each word in that phrase.

class Phrase
  attr_reader :phrase

  def initialize(phrase = '')
    @phrase = phrase
  end

  def word_count
    word_count = Hash.new
    words = phrase.gsub(/[^a-zA-Z0-9']/, ' ').downcase.split(' ')
    words.map { |element| element.gsub!("'", '') if element.count("'") > 1 } 
    words.uniq.each do |element|
      word_count[element] = words.count(element)
    end
    word_count
  end
end

# some_phrase = Phrase.new("olly olly in come free")
# some_phrase.word_count