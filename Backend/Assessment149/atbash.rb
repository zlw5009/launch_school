# frozen_string_literal: true

# Create an implementation of the atbash cipher,
# an ancient encryption system created in the Middle East.

# It's a substitution cipher that substitutes the first letter
# for the last, the second letter for second to last, etc. Example:

#  First 13 letters: A|B|C|D|E|F|G|H|I|J|K|L|M
#  Last 13 letters:  Z|Y|X|W|V|U|T|S|R|Q|P|O|N

# In Atbash, the letters "nlmvb" indicate the word "money".

class Atbash
  ALPHABET = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z).freeze

  def self.word_split(words)
    words.split(//).keep_if { |x| x =~ /[a-zA-Z0-9]/ }
  end

  def self.encoded_spacing(encoded_words)
    encoded_string = encoded_words.join('')
    if encoded_string.length > 5
      encoded_string.gsub(/.{5}(?=.)/, '\0 ')
    else
      encoded_string
    end
  end

  def self.encode(words)
    encoded_words = []

    word_split(words).map do |char|
      if ALPHABET.include?(char.upcase)
        x = ALPHABET.index(char.upcase)
        y = ALPHABET.at((ALPHABET.size - 1) - x)
        encoded_words << char.replace(y).downcase
      else
        encoded_words << char
      end
    end
    encoded_spacing(encoded_words)
  end
end
