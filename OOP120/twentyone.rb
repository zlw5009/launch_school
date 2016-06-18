# frozen_string_literal: true

module Actionable
  BLACKJACK = 21

  def busted?
    total > BLACKJACK
  end

  def collect_card(new_card)
    hand << new_card
  end

  def show_hand
    clear
    puts "---#{name}'s Hand---"
    hand.each do |card|
      puts card.to_s
    end
    puts ""
    puts "Total = #{total}"
  end

  def total
    total = 0
    hand.each do |card|
      total += if card.ace?
                 11
               elsif card.jack? || card.queen? || card.king?
                 10
               else
                 card.face.to_i
               end
    end

    hand.select(&:ace?).count.times do
      break if total <= BLACKJACK
      total -= 10
    end

    total
  end

  def clear
    system 'clear'
  end
end

class Participant
  include Actionable

  attr_accessor :name, :hand

  def initialize
    @hand = []
    set_name
  end
end

class Player < Participant
  def show_flop
    show_hand
  end

  def set_name
    answer = ''
    loop do
      puts "What is your name?"
      answer = gets.chomp.capitalize
      break if answer > ''
      puts "Sorry, please enter your name."
    end
    self.name = answer
  end
end

class Dealer < Participant
  NAMES = %w(Natalia Lily Kristina Kelsey Andrea).freeze

  def show_flop
    puts "---#{name}'s Hand---"
    hand.first.to_s
    puts "---??---"
    puts ""
  end

  def set_name
    self.name = NAMES.sample
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @deck << Card.new(suit, face)
      end
    end

    deck.shuffle!
  end

  def deal_card
    deck.shift
  end
end

class Card
  SUITS = %w(H D C S).freeze
  FACES = ([*2..10] + %w(J Q K A)).freeze

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def suit
    case @suit
    when 'H'
      'Hearts'
    when 'D'
      'Diamonds'
    when 'C'
      'Clubs'
    when 'S'
      'Spades'
    end
  end

  def face
    case @face
    when 'J'
      'Jack'
    when 'Q'
      'Queen'
    when 'K'
      'King'
    when 'A'
      'Ace'
    else
      @face
    end
  end

  def to_s
    "The #{face} of #{suit}."
  end

  def ace?
    face == 'Ace'
  end

  def jack?
    face == 'Jack'
  end

  def queen?
    face == 'Queen'
  end

  def king?
    face == 'King'
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards
    2.times do
      player.collect_card(deck.deal_card)
      dealer.collect_card(deck.deal_card)
    end
  end

  def show_initial_cards
    player.show_flop
    dealer.show_flop
  end

  def player_turn
    loop do
      puts "Type 'h' to Hit or 's' to Stay."
      answer = gets.chomp.downcase
      answer.include?('h') ? hit! : break
      break if player.busted?
    end
  end

  def hit!
    player.collect_card(deck.deal_card)
    player.show_flop
  end

  def dealer_turn
    dealer.show_hand
    if dealer.total < 17 || !dealer.busted?
      dealer.collect_card(deck.deal_card)
    end
  end

  def determine_winner
    if ((player.total > dealer.total) && !player.busted?) || dealer.busted?
      puts "#{player.name} WINS!"
    elsif ((dealer.total > player.total) && !dealer.busted?) || player.busted?
      puts "#{dealer.name} WINS."
    else
      puts "It's a tie"
    end
  end

  def display_scores
    puts "#{player.name}'s Score: #{player.total}." \
         " #{dealer.name}'s Score: #{dealer.total}."
    puts ""
  end

  def show_result
    puts ""
    if player.busted?
      puts "#{player.name} Busted!"
    elsif dealer.busted?
      puts "#{dealer.name} Busted!"
    end
    display_scores
    determine_winner
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, answer must be y or n."
    end

    answer == 'y'
  end

  def reset
    self.deck = Deck.new
    player.hand = []
    dealer.hand = []
  end

  def start
    loop do
      deal_cards
      show_initial_cards
      player_turn

      loop do
        break if player.busted?
        dealer_turn
        break if dealer.total >= 17
      end

      show_result

      play_again? ? reset : break
    end
  end
end

Game.new.start
