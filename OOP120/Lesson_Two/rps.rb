# Rock, Paper, Scissors game

module Displayable
  def display_welcome_message
    puts "Welcome, #{human.name} to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Goodbye, #{human.name.capitalize}!"
  end

  def display_score
    puts "#{human.name}'s Score: #{human.score}"
    puts "#{computer.name}'s Score: #{computer.score}"
  end

  def display_moves
    puts "#{human.name.capitalize} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      human.increment_score
      puts "You won!"
    elsif human.move < computer.move
      computer.increment_score
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def clear_screen
    system("clear") || system("cls")
  end
end

class Move
  VALUES = %w(rock paper scissors).freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def to_s
    @value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0 
  end

  def increment_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a name!"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, that choice was invalid."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Tweeter', 'Billy Bob', 'Mox', 'Lance',
                 'Jules', 'Darcy', 'Kilmer'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  include Displayable

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "That's an invalid choice."
    end

    answer == 'y' ? true : false
  end

  def play
    display_welcome_message
    loop do
      clear_screen
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
