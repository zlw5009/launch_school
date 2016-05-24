# Twenty-one
SUITS = %w(H D C S)
def prompt(msg)
  puts "=> #{msg}"
end

# Creates the deck of cards
def initialize_deck
  cards = []
  (2..10).each { |num| cards << num }
  cards += %w(J Q K A)
  deck_of_cards = cards.product(SUITS)
end

# We need a method that will deal a card to a player
# We have our deck of cards initialized
# 1. append a card to the players array
# => the card should be chosen at random from the deck
# => the card that is appended to the players array
# => should be deleted from the deck once it's been dealt

def deal_cards(deck, player)
  player << deck.shuffle!.shift
end

def setup_initial_hands(deck, player_hand, dealer_hand)
  deal_cards(deck, player_hand)
  deal_cards(deck, dealer_hand)
  deal_cards(deck, player_hand)
  deal_cards(deck, dealer_hand)
end

loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  setup_initial_hands(deck, player_cards, dealer_cards)
  
end
