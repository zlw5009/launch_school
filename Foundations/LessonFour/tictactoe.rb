# Tic Tac Toe
require 'rubocop'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  prompt "You're a #{PLAYER_MARKER} and the Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board # Creates the board hash
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter = ', ', word = 'or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count(PLAYER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_winning_square(line, brd)
  if brd.values_at(*line).count(COMPUTER_MARKER) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def switch_player(current)
  current = (current == 'Player') ? 'Computer' : 'Player'
end

def place_piece!(brd, current)
  if current == "Player"
    player_turn!(brd)
  else
    computer_turn!(brd)
  end
end

def player_turn!(brd) # Places an X for the player in the appropriate square
  square = ''

  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd), ', ')}):")
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice")
  end

  brd[square] = PLAYER_MARKER
end

def computer_turn!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = computer_winning_square(line, brd) ||
             find_at_risk_square(line, brd)
    break if square
  end

  if !square
    square = 5 if empty_squares(brd).include?(5)
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_score = 0
computer_score = 0
current_player = ''
who_goes = ''

loop do
  loop do
    loop do
      prompt "Choose who goes first: 'P' for Player or 'C' for Computer?"
      who_goes = gets.chomp

      if who_goes.downcase == 'p'
        current_player = 'Player'
        break
      elsif who_goes.downcase == 'c'
        current_player = 'Computer'
        break
      else
        prompt "That is not a correct choice."
      end
    end

    board = initialize_board

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = switch_player(current_player)
      break if board_full?(board) || someone_won?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == 'Player'
        player_score += 1
      else
        computer_score += 1
      end
    else
      prompt "It's a tie!"
    end

    prompt "The score is: You = #{player_score}, Computer = #{computer_score}"
    break if player_score >= 5 || computer_score >= 5
  end

  prompt "Would you like to play again: Yes or No?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe. Goodbye!"
