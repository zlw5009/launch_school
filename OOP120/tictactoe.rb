# frozen_string_literal: true

require 'pry'

module Joinable
  def joinor(array, delimiter=', ', word='or')
    array[-1] = "#{word} #{array.last}" if array.size > 1
    array.size == 2 ? array.join(' ') : array.join(delimiter)
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye, #{human.name}!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. " \
    "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_score
    puts "#{human.name}'s score is: #{human.score}."
    puts "#{computer.name}'s score is: #{computer.score}"
  end

  def winner_prompt
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_result
    clear_screen_and_display_board
    winner_prompt
    display_score
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

class Board
  include Joinable

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def computer_intelligence(player_marker)
    WINNING_LINES.each do |line|
      current_positions = line.map { |value| @squares[value].marker }
      if current_positions.count(player_marker) == 2 \
        && current_positions.include?(Square::INITIAL_MARKER)
        return line[current_positions.index(Square::INITIAL_MARKER)]
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  # def two_identical_markers?(squares)
  #   markers = squares.select(&:marked?).collect(&:marker)
  #   return false if markers.size != 2
  #   markers.min == markers.max
  # end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    !unmarked?
  end
end

class Player
  attr_accessor :score, :marker, :name

  def initialize(marker)
    @marker = marker
    @score = 0
    @name = ''
  end

  def increment_score
    self.score += 1
  end
end

class Human < Player
  def set_name
    puts "What is your name?"
    self.name = gets.chomp.capitalize
  end
end

class Computer < Player
  COMPUTER_NAMES = ['Billy Bob', 'Mox', 'Tweeter', 'Jules']

  def set_name
    self.name = COMPUTER_NAMES.sample
  end
end

class TTTGame
  include Displayable

  WINNING_SCORE = 5
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_writer :current_marker
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    human.set_name
    computer.set_name
    clear

    loop do

      loop do
        display_board
        choose_marker
        set_marker
        who_moves_first

        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end

        calculate_score
        display_result
        break if match_winner?
        pause
        reset
      end
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def choose_marker
    answer = nil
    loop do
      puts "#{human.name}, would you like to be 'X' or 'O'?"
      answer = gets.chomp.downcase
      break if %(x o).include? answer
      puts "You must choose 'X' or 'O'."
    end

    answer == 'x' ? human.marker = HUMAN_MARKER : human.marker = COMPUTER_MARKER
  end

  def set_marker
    if human.marker == HUMAN_MARKER
      computer.marker = COMPUTER_MARKER
    else
      computer.marker = HUMAN_MARKER
    end
  end

  def who_moves_first
    who_moves = nil
    loop do
      puts "#{human.name}, would you like to go first? (y/n)"
      who_moves = gets.chomp.downcase
      break if %(y n).include? who_moves
      puts "Sorry, you must select y or n."
    end

    who_moves.include?('y') ? self.current_marker = human.marker \
    : self.current_marker = computer.marker
  end

  def human_turn?
    @current_marker == human.marker
  end

  def human_moves
    puts "#{human.name}, choose a square (#{board.joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    computer_choice = board.computer_intelligence(computer.marker)
    if !computer_choice
      computer_choice = board.computer_intelligence(human.marker)
    end

    if !computer_choice && board.unmarked_keys.include?(5)
      computer_choice = 5
    end

    if !computer_choice
      computer_choice = board.unmarked_keys.sample
    end

    board[computer_choice] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def calculate_score
    case board.winning_marker
    when human.marker
      human.increment_score 
    when computer.marker
      computer.increment_score
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again, #{human.name}? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def match_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def pause
    puts "Press enter to continue"
    gets.chomp
  end
end

game = TTTGame.new
game.play
