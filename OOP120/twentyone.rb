require 'pry'

module Actionable
  def hit!

  end

  def stay

  end

  def busted?

  end

  def collect_card(new_card)
    hand << new_card
  end

  def show_hand
    puts "Hand"
    hand.each do |card|
      puts "#{card}"
    end
  end
end

class Participant
  include Actionable

  attr_accessor :name, :hand

  def initialize
    @hand = []
  end
end

class Player < Participant
  def show_flop
    show_hand
  end
end

class Dealer < Participant
  def show_flop
    show_hand
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
  SUITS = %w(H D C S)
  FACES = [*2..10] + %w(J Q K A)

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

  def start
    deal_cards
    show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end


end

Game.new.start
