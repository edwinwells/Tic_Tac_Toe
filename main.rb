require_relative "board.rb"
require_relative "terminal.rb"

newboard=Board.new
terminal=Terminal.new
 
newboard={
			:a1=>"O", :a2=>"O", :a3=>"O",
		 	:b1=>"X", :b2=>"", :b3=>"O",
		  	:c1=>"X", :c2=>"O", :c3=>"X"	
		 }


terminal.rows(newboard)
# terminal.check_for_wins(newboard)
