class Scrabble
  VALUES = { "aeioulnrst" => 1, 
            "dg" => 2, 
            "bcmp" => 3,
            "fhvwy" => 4,
            "k" => 5,
            "jx" => 8,
            "qz" => 10
          }
           
  def initialize(word)
    @word = word.to_s
  end

  def score
    chars = @word.chars
    return 0 unless @word

    chars.inject(0) do |sum, char|
      score = VALUES.find { |k, _| k.include? char.downcase }
      sum += score[1] if score
      sum 
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

Scrabble.new(" \t\n").score