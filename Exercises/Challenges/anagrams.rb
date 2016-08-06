# Anagrams Challenge

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(array)
    array.select { |word| anagram?(word) }
  end

  def anagram?(match_word)
    match_word = match_word.downcase
    return if match_word == @word

    match_word.chars.sort == @word.chars.sort
  end
end