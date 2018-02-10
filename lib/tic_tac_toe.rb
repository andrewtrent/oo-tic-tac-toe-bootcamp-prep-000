class TicTacToe
  
  
  WELCOME_MESSAGE = "Welcome to Tic Tac Toe!"
  INPUT_PROMPT = "Please enter 1-9:"
  INVALID_INPUT = "That is not a valid move."
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  
  class Move
    
    def input_to_index(input)
      @index = input.to_i - 1
    end

    def move(@board, @index, @token)
      @board[@index] = @token
    end
    
    def move_on_board?(board, index)
      if @index >= 0 && @index <= 8
        true 
      else
        false
      end
    end 

    def position_taken?(@board, @index)
      !(@board[@index].nil? || @board[@index] == " ")
    end
  
    def valid_move?(@board, @index)
      # apply both tests and return the result
      if move_on_board?(@board, @index) && !position_taken?(@board, @index)
        true
      else
        false
      end
    end
    
    
    class Conclusion
       def won?(board)
   
        # set return variable to default value. By default nobody has won.
        return_val = false
  
        #drop down a level in the array of winning combinations
        WIN_COMBINATIONS.each do |comb| 
  
        # pass tests for "X" and "O" to #all? 
        if comb.all? {|space| board[space] == "X"} || comb.all? {|space| board[space] == "O"}
          return_val = comb
        end
      end
      #return new return value
      return_val
    end
    
       
    def full?(board)
      return_val = true
    
      board.each_index do |cell| 
        if !position_taken?(board, cell)
         return_val = false
        end
      end
      return_val
    end

    def draw?(board)
      if !won?(board) && full?(board)
        true
      else 
        false
      end
    end

    def over?(board)
      if draw?(board) || won?(board)
        true
      else
        false
      end
    end

    def winner(board)
      if won?(board)
        board[won?(board)[0]]
      elsif draw?(board)
        board[won?(board)[0]]
      end
    end
  end
  
  def turn(@board)
    puts INPUT_PROMPT
    @choice = gets.chomp
    @choice = input_to_index(choice)
    @truthiness = valid_move?(board, choice)
    if !@truthiness
      puts INVALID_INPUT
      turn(board)
    else
      move(board, choice, char = current_player(board))
      display_board(board)
    end  
  end
    
end

  
end