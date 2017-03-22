require_relative "board.rb"
require_relative "terminal.rb"

newgame = Board.new
terminal = Terminal.new




		win = false
		until newgame.check_full? == true ||
			  win == true do

			print newgame.setup
			puts ""

			newgame.get_X(newgame)
			terminal.rows(newgame.setup)

			if newgame.check_full?() == true ||
			  win == true
			  puts""
			  print " Care for another game? (Y or N) "
			  again = gets.chomp
			  	if again = "Y" || "y"
			  		goto 1
			  	else 
			  		exit
			  	end
			end

			newgame.get_O(newgame)
			terminal.rows(newgame.setup)

			if newgame.check_full?() == true ||
			  win == true
			  puts""
			  print " Care for another game? (Y or N) "
			  again = gets.chomp
			  	if again = "Y" || "y"
			  		goto 1
			  	else 
			  		exit
			  	end
			end
		end
