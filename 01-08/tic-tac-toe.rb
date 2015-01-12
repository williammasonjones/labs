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

  # Setup Player 1
  puts "Player 1: What's your name?"
  player1_name = gets.chomp
  unless player1_name.empty?
    players[:player1][:name] = player1_name
  end
  puts "Hello #{players[:player1][:name]}! Please choose a piece ('X' or 'O'):"
  players = choose_pieces(gets.chomp, players)

  # Setup Player 2
  puts "Player 2: What's your name? (Leave blank for AI)"
  player2_name = gets.chomp
  if player2_name.empty?
    players[:player2][:ai] = true
  else
    players[:player2][:name] = player2_name
  end
  puts

  # Let's recap the setup
  players.each do |key, player|
    print "#{player[:name]} "
    if player[:ai]
      print "(AI) "
    end
    print "is '#{player[:piece]}'\n"
  end
  puts

  # Round Start
  turn = :player1
  while true do
    draw_board(board)

    if players[turn][:ai]
      index = board.reject{|k,v| v == 'X' || v == 'O'}.keys.sample
      puts "#{players[turn][:name]} chooses space #{index}.\n"
    else
      puts "#{players[turn][:name]}, please choose an empty space (0-8):"
      index = gets.chomp.to_i
    end
     

end
