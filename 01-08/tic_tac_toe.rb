require 'pry'

def choose_pieces piece, players
    # Player 1 gets priority pick
    piece.upcase!
    if piece == 'O'
        players[:player1][:piece] = 'O'
        players[:player2][:piece] = 'X'
    else
        players[:player1][:piece] = 'X'
        players[:player2][:piece] = 'O'
    end
    return players
end

def draw_board board
    index = 0
    (0..2).each do |row|
        (0..2).each do |col|
            print " #{board[index]} "
            if col < 2
                print "|"
            end
            index += 1
        end
        puts
        if row < 2
            puts '-----------'
        end
    end
    puts
end

def game_over? board, player, index
    piece = player[:piece]

    rows = [[0,1,2], [3,4,5], [6,7,8]]
    cols = [[0,3,6], [1,4,7], [2,5,8]]
    diags = [[0,4,8], [2,4,6]]

    # The following 3 loops should be combined into a single function
    # Do you see the patterns / similarities between the loops?
    # rows.each do |row|
    #     if row.include?(index) && row.map{|i| board[i]} == line
    #         win = true
    #         break
    #     end
    # end
    # has_line(rows, index, board)

    # cols.each do |col|
    #     if col.include?(index) && col.map{|i| board[i]} == line
    #         win = true
    #         break
    #     end
    # end
    # has_line(cols, index, board)

    # diags.each do |diag|
    #     if diag.include?(index) && diag.map{|i| board[i]} == line
    #         win = true
    #         break
    #     end
    # end
    # has_line(diags, index, board)

    # Check for win
    if has_line(rows, index, board, piece) || has_line(cols, index, board, piece) || has_line(diags, index, board, piece)
        puts "#{player[:name]} wins this round!!!"
        puts
        draw_board(board)
        return true
    end

    # Check the board for empty spaces
    board.each do |key, val|
        unless val == 'X' || val == 'O'
            return false
        end
    end

    # Tied game
    puts "The cat wins this round."
    puts
    draw_board(board)
    return true
end

def has_line collection, index, board, piece
    line = [piece, piece, piece]
    collection.each do |item|
        if item.include?(index) && item.map{|i| board[i]} == line
            return true
        end
    end
    return false
end

# Game Start
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

        # Fill the specified space on the board
        board[index] = players[turn][:piece]
        if game_over?(board, players[turn], index) then break end

        if turn == :player1
            turn = :player2
        else
            turn = :player1
        end
    end

    puts "Would you like to play again? (Y/N)"
    if gets.chomp.downcase == 'n' then break end
end
