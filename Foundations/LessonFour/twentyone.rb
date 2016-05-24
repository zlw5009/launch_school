# Twenty-one
SUITS = %w(H D C S)

def prompt(msg)
  puts "=> #{msg}"
end

# Creates the deck of cards
def initialize_deck
  cards = [*2..10]
  cards += %w(J Q K A)
  cards.product(SUITS)
end

# Deals a card to the selected player
def deal_cards(deck, player)
  player << deck.shuffle!.shift
end

# Deals the initial hands to both dealer and player
def setup_initial_hands(deck, player_cards, dealer_cards)
  2.times do
    deal_cards(deck, player_cards)
    deal_cards(deck, dealer_cards)
  end
  display_board_players_turn(player_cards, dealer_cards)
end

# Display's UI for cards
def display_dealers_initial_hand(card_one, _card_two)
  puts ""
  puts "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+\n" \
    + "|" + card_one[0].to_s + " " * (card_one[0] == 10 ? 9 : 10) + "|" \
    + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 5 + card_one[1] + " " * 5 + "|" + "  " + "|" + " " * 11 \
    + "|\n" + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * 11 + "|" + "  " + "|" + " " * 11 + "|\n" \
    + "|" + " " * (card_one[0] == 10 ? 9 : 10) + card_one[0].to_s + "|" + "  " \
    + "|" + " " * 11 + "|\n" \
    + "+" + "-" * 11 + "+" + "  " + "+" + "-" * 11 + "+"
end

def render_cards(hand)
  part_one = []
  part_two = []
  part_three = []
  part_four = []
  part_five = []
  part_six = []
  part_seven = []
  part_eight = []
  part_nine = []

  hand.each do |card|
    part_one << "+" + "-" * 11 + "+" + "  "
    part_two << if card[0] == 10
                  "|" + card[0].to_s + " " * 9 + "|" + "  "
                else
                  "|" + card[0].to_s + " " * 10 + "|" + "  "
                end
    part_three << "|" + " " * 11 + "|" + "  "
    part_four << "|" + " " * 11 + "|" + "  "
    part_five << "|" + " " * 5 + card[1] + " " * 5 + "|" + "  "
    part_six << "|" + " " * 11 + "|" + "  "
    part_seven << "|" + " " * 11 + "|" + "  "
    part_eight << if card[0] == 10
                    "|" + " " * 9 + card[0].to_s + "|" + "  "
                  else
                    "|" + " " * 10 + card[0].to_s + "|" + "  "
                  end
    part_nine << "+" + "-" * 11 + "+" + "  "
  end

  puts part_one.join
  puts part_two.join
  puts part_three.join
  puts part_four.join
  puts part_five.join
  puts part_six.join
  puts part_seven.join
  puts part_eight.join
  puts part_nine.join
end

# Calc the # of Aces
def number_of_aces(hand)
  aces = 0

  hand.each do |card|
    if card[0] == 'A'
      aces += 1
    end
  end
  aces
end

# Calc the total score of all cards but Aces
def total_cards_not_aces(hand)
total = 0 

  hand.each do |card|
    if card[0] != 'A' && card[0].to_i == 0
      total += 10
    elsif card[0] != 'A'
      total += card[0]
    end
  end
total
end

# Calc the total value of all cards
def cards_total(hand)
  total = 0

  if total_cards_not_aces(hand) > 10
    total = (number_of_aces(hand) * 1) + total_cards_not_aces(hand)
  elsif total_cards_not_aces(hand) <= 10 && number_of_aces(hand) <= 1
    total = (number_of_aces(hand) * 11) + total_cards_not_aces(hand)
  else
    total = total_cards_not_aces(hand)
  end
total
end

# Determines if a player busts
def busted?(hand)
  cards_total(hand) > 21
end

def display_board_players_turn(player_cards, dealer_cards)
  system('clear') || system('cls')
  display_dealers_initial_hand(*dealer_cards)
  render_cards(player_cards)
  puts "Player: #{cards_total(player_cards)}"
end

def display_board_dealers_turn(player_cards, dealer_cards)
  system('clear') || system('cls')
  render_cards(dealer_cards)
  render_cards(player_cards)
  puts "Player: #{cards_total(player_cards)}"
  puts "Dealer: #{cards_total(dealer_cards)}"
end

loop do # Main loop
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  setup_initial_hands(deck, player_cards, dealer_cards)

  loop do # Players turn
    display_board_players_turn(player_cards, dealer_cards)
    prompt "Hit or Stay?"
    answer = gets.chomp
    if answer.downcase == 'stay'
      break
    elsif answer.downcase == 'hit'
      deal_cards(deck, player_cards)
    end
    break if busted?(player_cards)
  end

  unless busted?(player_cards)
    loop do # Dealers turn
      display_board_dealers_turn(player_cards, dealer_cards)
      if cards_total(dealer_cards) > cards_total(player_cards) || 
         cards_total(dealer_cards) == 21
        break
      else
        deal_cards(deck, dealer_cards)
      end
    end
  end

  display_board_dealers_turn(player_cards, dealer_cards)

  if busted?(dealer_cards)
    prompt "The Dealer Busted!! You Win!!"
  elsif busted?(player_cards)
    prompt "BUST!! You Lose!"
  elsif cards_total(player_cards) < cards_total(dealer_cards)
    prompt "The Dealer had a better hand; You Lose!!"
  else
    prompt "You both got 21. It's a tie!!"
  end

  prompt "Would you like to play again: Yes or No?"
  play_again = gets.chomp
  break if !play_again.downcase.start_with?('y')
end 
