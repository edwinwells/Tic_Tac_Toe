require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"


def startgame()
# newgame = GameBoard.new
# terminal = Terminal.new

#Should the following sec. be in Player Class? I think so
#Determine which player will be "X":
	response = ""
	puts""
 		
	until response == "X" || response == "O" do
		print " Will you choose to play as X or O? \n Enter X or O: "
		response = gets.chomp.upcase
		puts ""
 	end
 	# p response

 	if response == "X"
		playerX = Player.new("X")
		playerO = ComputerRandom.new("O")
		reset = "N"
		freshgame = Game.new(playerX, playerO, reset)
		# p freshgame
		# @newboard = GameBoard.new()

	elsif response == "O"
		playerX = ComputerRandom.new("X")
		playerO = Player.new("O")
		reset = "N"
		freshgame = Game.new(playerX, playerO, reset)
		# p freshgame
		@newboard = GameBoard.new()
	end

		freshgame.run_game(playerX, playerO, response)
		# p freshgame.reset
		# p freshgame.reset
	    if freshgame.reset.downcase == "y"
			startgame() 
	    else
	        exit
	    end


end
# game = Game.new(game, playerX, playerO)
startgame()