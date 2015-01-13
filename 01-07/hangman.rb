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
  answer.chars.all? { |l| guessed.include?(l) }
end

def finished?(turns, guessed, answer)
  turns.zero? || complete_word?(answer, guessed)
end

def greeting(turn_count)
  puts "Welcome to Will's hanging!. Guess a word in #{turn_count} chances to save my neck!."
  puts
end

def game_over(answer, guessed)
  puts answer
  puts
  if complete_word?(answer, guessed)
    puts "Thank you for saving my neck!"
  else
    puts "I'm hanged. Some friend you were..."
  end
end

def display_guesses(answer, guessed)
  result = answer.each_char do |c|
    if guessed.include?(c)
      print(c)
    else
      print "_"
    end
  end
end

def prompt_player
  puts "Guess a letter to start the game..."
  letter = gets.chomp
end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  greeting(turn_count)
  until finished?(turn_count, guessed, answer)
    guess = prompt_player
    guessed.add(guess)
    display_guesses(answer,guessed)
    unless answer.include?(guess)
      turn_count -= 1
    end
  end
  puts
  game_over(answer, guessed)
end

hangman(words)
