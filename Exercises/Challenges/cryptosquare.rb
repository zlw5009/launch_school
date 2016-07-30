# Cryto square

# Take a string, downcase it, eliminate white spaces and punction.
# Count the number of characters in the string
# Form a square according to the num of characters in the string
# - Find the perfect squares
# - If a number is not a perfect square, use the closest perfect square above that number

require 'pry'

class Crypto
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    message.downcase.gsub(/\W/, '')
  end

  def size
    (normalize_plaintext.length**0.5).ceil
  end

  def segmentation(string)
    string.split('').each_slice(size).map(&:join)
  end

  def plaintext_segments
    segmentation(normalize_plaintext)
  end

  def ciphertext
    crypto_segment.join
  end

  def normalize_ciphertext
    crypto_segment.join(' ')
  end

  def ciphered(row)
    cipher_row = []

    row.each do |element|
      cipher_row << element.shift unless element.empty?
    end
    cipher_row.join
  end

  def crypto_segment
    square_of_ciphers = []
    crypto_segments = plaintext_segments.map(&:chars)

    size.times do
      square_of_ciphers << ciphered(crypto_segments)
    end
    
    square_of_ciphers
  end
end

crypt = Crypto.new('Vampires are people too!')
p crypt.crypto_segment