require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"


def startgame()
newgame = GameBoard.new
terminal = Terminal.new

#Determine which player will be "X":
	response = ""
	puts""
 		
	until response == "X" || response == "O" do
		print " Will you choose to play as X or O? \n Enter X or O: "
		response = gets.chomp.upcase
		puts ""
 	end

		if response == "X"
			while newgame.check_full? == false ||
		  terminal.win == false do

				puts ""
	    		print newgame.setup
				newgame.get_player_move("X")
				newgame.game_status(terminal, newgame, "X")
					
				puts "And..."
				puts "The computer moves!: "
				newgame.get_unbeatable_computer_player_O_move(terminal, newgame, "O")
				newgame.game_status(terminal, newgame, "O")	
			end
		end

		if response == "O"
			while newgame.check_full? == false ||
		  terminal.win == false do

	    		puts "Current board: #{newgame.setup}"
				puts "And..."
				puts "The computer moves!: "
				newgame.get_unbeatable_computer_player_X_move(terminal, newgame, "X")
				newgame.game_status(terminal, newgame, "X")

				puts ""
	    		puts "Current board: #{newgame.setup}"
				newgame.get_player_move("O")
				newgame.game_status(terminal, newgame, "O")					
			end
		end		
end
startgame()