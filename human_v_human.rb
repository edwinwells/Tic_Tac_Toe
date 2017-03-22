require_relative "board.rb"
require_relative "terminal.rb"

def startgame()
newgame = Board.new
terminal = Terminal.new
			  	puts "terminal.win: #{terminal.win}"


	 	newgame.setup = terminal.rows(newgame.setup)

		puts "check_full: #{newgame.check_full?}"
		print newgame.setup
		print"HI"
		print newgame
		terminal.showboard(newgame.setup)

		while newgame.check_full? == false ||
			  terminal.win == false do
			puts "newgame"
			terminal.showboard(newgame.setup)
			puts ""

			newgame.get_X()
			  	puts "terminal.win: #{terminal.win}"
			terminal.check_for_wins(newgame.setup)
			  	puts "terminal.win: #{terminal.win}"
			terminal.showboard(newgame.setup)
			  	puts "terminal.win: #{terminal.win}"
			if newgame.check_full? == true ||
			  terminal.win == true
			  	puts "terminal.win: #{terminal.win}"
				  print " Care for another game? (Y or N) "
				  again = gets.chomp

				  	if again == "y"
				  		startgame()
				  	else 
				  		exit
				  	end			
			end	

			newgame.get_O()
			terminal.check_for_wins(newgame.setup)
			terminal.showboard(newgame.setup)
			if newgame.check_full? == true ||
			  terminal.win == true
			  print " Care for another game? (Y or N) "
			  again = gets.chomp
			  	if again == "y"
			  		startgame()
			  	else
			  	    exit
			  	end			
			end	
		end
end
startgame()