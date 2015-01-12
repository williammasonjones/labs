require 'pry'

# Start the game
puts "Welcome to Will's fabulous Tic-Tac-Toe game!"

while true do
  players = {
    :player1 => {:name => 'Player 1', :piece => nil, :ai => false},
    :player2 => {:name => 'Player 2', :piece => nil, :ai => false}
  }

  # Initialize the board
  board = {}
  (0..8).each do |index|
    board[index] = index.to_s
  end

end
