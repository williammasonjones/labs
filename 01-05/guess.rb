
puts "This is the guessing game!"
puts "Guess a number between 1 and 100."
answer = rand(1..100)
guess = gets.chomp.to_i


until guess == answer do
if guess > answer
  puts "You guessed to high! Try something lower."
  guess = gets.chomp.to_i
elsif guess < answer
  puts "You guessed to low! Try something higher."
  guess = gets.chomp.to_i
else
  puts "That's not a number between 1 and 100. Try again"
  guess = gets.chomp.to_i
end
end

puts "You guessed the magic number!"
