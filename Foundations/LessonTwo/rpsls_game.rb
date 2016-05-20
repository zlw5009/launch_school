# rock_paper_scissors_lizard_spock game

# to accept the first letter of each choice 
# could store the letter and word in a hash
# could use a case statement that signifies what each letter stands for
# could use a nested array

VALID_CHOICES = %w(rock paper scissors lizard spock)
user_score = 0
computer_score = 0

def prompt(msg)
  puts("=> #{msg}")
end

def find_abbreviation(array)
  valid_abbreviation = []
  array.each do |word|
    valid_abbreviation << word.chars.first
  end
  valid_abbreviation
end

def word_abbreviation(letter)
  case letter
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  when 'sc'
    'scissors'
  end
end

def win?(first, second)
  (first == 'rock' && ((second == 'scissors') || (second == 'lizard'))) || 
  (first == 'scissors' && ((second == 'paper') || (second == 'lizard'))) ||
  (first == 'paper' && ((second == 'rock') || (second == 'spock'))) ||
  (first == 'lizard' && ((second == 'spock') || (second == 'paper'))) ||
  (first == 'spock' && ((second == 'scissors') || (second == 'rock')))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("WINNER!!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end
end

loop do

    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = gets.chomp

      if VALID_CHOICES.include?(choice) || find_abbreviation(VALID_CHOICES).include?(choice)
        break
      else
        prompt("That was an incorrect choice. Please try again.")
      end
    end

    if (choice == 's' && choice.length == 1)
      prompt("Are you selecting scissors: Yes or No?")
      interpretation = gets.chomp
      if interpretation.downcase.start_with?('y')
        choice = word_abbreviation('sc')
      else 
        choice = word_abbreviation('sp')
      end
    elsif choice.length == 1
      choice = word_abbreviation(choice)
    end
      
    computer_choice = VALID_CHOICES.sample
    prompt("You chose #{choice}, the computer chose #{computer_choice}.")

    display_results(choice, computer_choice)
  
    if win?(choice, computer_choice) 
      user_score = user_score + 1
    elsif win?(computer_choice, choice) 
      computer_score = computer_score + 1
    end
  
    prompt("Your score is: #{user_score}. The computer's score is: #{computer_score}.")
  
    break if user_score > 4 || computer_score > 4

  prompt("Do you want to play again: Yes of No?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Ro-Sham-Bo!")
