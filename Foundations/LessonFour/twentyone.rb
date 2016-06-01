# Twenty-one
SUITS = %w(H D C S).freeze
BLACKJACK = 21

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initialize_deck
  cards = [*2..10] + %w(J Q K A)
  cards.product(SUITS)
end

def deal_card(deck, player)
  player << deck.shuffle!.shift
end

def setup_initial_hands(deck, player_cards, dealer_cards)
  2.times do
    deal_card(deck, player_cards)
    deal_card(deck, dealer_cards)
  end
  display_board_players_turn(player_cards, dealer_cards)
end

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

def number_of_aces(hand)
  aces = 0

  hand.each do |card|
    if card[0] == 'A'
      aces += 1
    end
  end
  aces
end

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

def busted?(hand)
  cards_total(hand) > BLACKJACK
end

def display_board_players_turn(player_cards, dealer_cards)
  clear_screen
  display_dealers_initial_hand(*dealer_cards)
  render_cards(player_cards)
  puts "Player: #{cards_total(player_cards)}"
end

def display_board_dealers_turn(player_cards, dealer_cards)
  render_cards(dealer_cards)
  render_cards(player_cards)
  puts "Player: #{cards_total(player_cards)}"
  puts "Dealer: #{cards_total(dealer_cards)}"
end

loop do # Main
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  setup_initial_hands(deck, player_cards, dealer_cards)

  loop do # Players turn
    display_board_players_turn(player_cards, dealer_cards)
    prompt "Hit or Stay?"
    answer = gets.chomp.downcase
    if answer == 'stay'
      break
    elsif answer == 'hit'
      deal_card(deck, player_cards)
    end
    break if busted?(player_cards)
  end

  unless busted?(player_cards)
    loop do # Dealers turn
      display_board_dealers_turn(player_cards, dealer_cards)
      if cards_total(dealer_cards) >= 17 ||
         cards_total(dealer_cards) == 21
        break
      else
        deal_card(deck, dealer_cards)
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
  elsif cards_total(player_cards) > cards_total(dealer_cards)
    prompt "You have a better hand than the dealer. You WIN!!"
  else
    prompt "You both got 21. It's a tie!!"
  end

  prompt "Would you like to play again: Yes or No?"
  play_again = gets.chomp.downcase
  break if !play_again.start_with?('y')
end
