require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"


def startgame()
newgame = GameBoard.new
terminal = Terminal.new
# thisone = Game.new
# game = Game.new(game, playerX, playerO)

#Determine which player will be "X":
	response = ""
	puts""
 		
	until response == "X" || response == "O" do
		print " Will you choose to play as X or O? \n Enter X or O: "
		response = gets.chomp.upcase
		puts ""
 	end

 	if response == "X"
		playerX = Player.new("X")
		playerO = ComputerRandom.new("O")
		game = Game.new(playerX, playerO)
		@newboard = GameBoard.new()
		game.run_game(playerX, playerO, response)
	elsif response == "O"
		playerX = ComputerRandom.new("X")
		playerO = Player.new("O")
		game = Game.new(playerX, playerO)
		@newboard = GameBoard.new()
		game.run_game(playerX, playerO, response)
	end


end
startgame()