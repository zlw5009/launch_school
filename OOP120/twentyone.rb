class Player

  attr_accessor :name, :hand

  def initialize
    @name = ''
    @hand = []
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Dealer
  def initialize
    @name = 'Natalia'
    @hand = []
  end
end

class Participant
  def initialize

  end
end

class Deck
  SUITS = %w(H D C S)

  attr_accessor :deck

  def initialize
    deck = [*2..10] + %w(J Q K A)
    deck.product(SUITS)
  end

  def deal_cards
    player << deck.suffle!.shift
  end
end

class Card
  def initialize
  end
end

class Game
  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

Game.new.start
