require_relative "board.rb"
require_relative "terminal.rb"

newboard=Board.new
terminal=Terminal.new
 
newboard=["X", "O", "O", "X", "", "O", "O", "X", "O"]

# rows(board_array)	

terminal.rows(newboard)