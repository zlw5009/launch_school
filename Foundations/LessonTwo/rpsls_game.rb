# rock_paper_scissors_lizard_spock game

VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(msg)
  puts("=> #{msg}")
end

def display_results(player, computer)
  if (player == 'rock' && (computer == 'scissors' || computer == 'lizard')) || 
     (player == 'scissors' && (computer == 'paper' || computer == 'lizard')) ||
     (player == 'paper' && (computer == 'rock' || computer == 'spock')) ||
     (player == 'lizard' && (computer == 'spock' || computer == 'paper')) ||
     (player == 'spock' && (computer == 'scissors' || computer == 'rock'))
    prompt("WINNER!")
  elsif player == computer
    prompt("It's a tie")
  else
    prompt("Loser :(")
  end
end
  

loop do

  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That was an incorrect choice. Please try again.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, the computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Do you want to play again: Yes of No?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Ro-Sham-Bo!")
