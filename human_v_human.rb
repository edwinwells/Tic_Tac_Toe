require_relative "board.rb"
require_relative "terminal.rb"

def startgame()
newgame = Board.new
terminal = Terminal.new


	 	newgame.setup = terminal.rows(newgame.setup)

		while newgame.check_full? == false ||
			  terminal.win == false do
			terminal.showboard(newgame.setup)
			puts ""

			newgame.get_X()
			terminal.check_for_wins(newgame.setup)
			terminal.showboard(newgame.setup)
			if newgame.check_full? == true
				  print " The game is tie! Care for another game? (Y or N) "
				  again = gets.chomp
			  	if again.downcase == "y"
			  		startgame()
			  	else 
			  		exit
			  	end
			end
			if	  terminal.win == true
				  print " Care for another game? (Y or N) "
				  again = gets.chomp
				  if again.downcase == "y"
				  	startgame()
				  else 
				  	exit
				  end			
			end	

			newgame.get_O()
			terminal.check_for_wins(newgame.setup)
			terminal.showboard(newgame.setup)
			if newgame.check_full? == true
				  print " The game is tie! Care for another game? (Y or N) "
				  again = gets.chomp
				  	if again.downcase == "y"
				  		startgame()
				  	else 
				  		exit
				  	end
			end
			if	  terminal.win == true
				  print " Care for another game? (Y or N) "
				  again = gets.chomp

				  	if again.downcase == "y"
				  		startgame()
				  	else 
				  		exit
				  	end			
			end
		end
end
startgame()