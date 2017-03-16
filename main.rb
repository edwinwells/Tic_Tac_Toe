require_relative "board.rb"
require_relative "terminal.rb"

newboard=Board.new
terminal=Terminal.new
 
newboard={:A1=>"X", :A2=>"O", :A3=>"O",
		  :B1=>"X", :B2=>:"", :B3=>"O",
		  :C1=>"O", :C2=>"O", :C3=>"X"	
			}


# rows(board_array)	

terminal.rows(newboard)