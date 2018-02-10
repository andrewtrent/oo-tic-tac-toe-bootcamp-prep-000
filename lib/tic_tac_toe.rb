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
  
  def input_to_index(input)
    @index = input.to_i - 1
  end
  
  def move_on_board?(index)
    if index >= 0 && index <= 8
      true 
    else
      false
    end
  end 
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if move_on_board?(index) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def move(board, index)
    @board[index] = @token
  end
  
  
end