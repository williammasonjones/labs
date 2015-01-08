## BEWARE THE SEMICOLON!

require 'pry'
require 'set'

words = ['angus',
  'onomatopeia',
  'mississippi',
  'cookies',
  'terminal',
  'illness',
  'communist',
  'dictator',
  'capitalist',
  'marxist',
  'darwinism']

def complete_word?(answer, guessed)
  answer.chars.all? { |x| guessed.include?(x) }
end

# def win?(turns)
#   !turns.zero?
# end
#
def finished? (turns, guessed, answer)
  turns.zero? || complete_word?(answer, guessed)
  # turns.zero? || answer.chars.all? { |l| guesses.include?(l) }
end
#
# def greeting
#   # TODO: tell the player about hangman
#   puts "Welcome to Will's hanging!"
#   puts
#   puts "Guess a word in 6 chances to save my neck!."
#   puts
# end

# def game_over(answer, turns)
#   # TODO: tell the player what the word was and if they won or lost
#   puts answer
#   puts
#   if finished?()
#     puts "Thank you for saving my neck!"
#   else
#     puts "Some friend you were..."
#   end
# end

# def display_guesses(guesses,answer)
#   # result = answer.each_char { |x| ...}
#   # puts result
# end

def prompt_player
  # TODO: get user input / show some status
  # call function that displays partially completed word
  puts "Guess a letter to start the game."
  guess = gets.chomp

end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  #greeting # TODO: Do I need an argument?
  until finished?(turn_count, guessed, answer)
    guess = prompt_player
    guessed.add(guess)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  game_over # TODO: Do I need an argument?
end

hangman(words)
