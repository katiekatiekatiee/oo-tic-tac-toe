class TicTacToe
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS= [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 4, 8], [2, 4, 6],
        [0, 3, 6], [1, 4, 7], [2, 5, 8]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
        
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        turns = 0
        @board.each do |p|
           if p == "X" || p == "O"
            turns += 1
           end
        end
        turns
    end

    def current_player
       if turn_count.even?
            "X"
       else
        "O"
       end
    end

    def turn
        puts "Please enter position 1-9: "
        position = gets.chomp
        index_position = input_to_index(position)

        if valid_move?(index_position)
            move(index_position, current_player)
        else
            turn
        end
        display_board
      
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            if @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[1]] && position_taken?(combo[0])
            return combo
            end
            
        end
        
    end

    def full?
        turn_count == 9
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || full?
    end

    def winner 
        won? ? @board[won?[0]] : nil
   
    end

    def play 
        # while !over? 
        #     turn
        # end
        # if won?
        #     puts "congratulations, #{winner}"
        # elsif draw?
        #     "It's a draw!"
        # end
        while !over? && !won? && !draw?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        end
        if draw?
            puts "Cat's Game!"
        end
    end
   
end
