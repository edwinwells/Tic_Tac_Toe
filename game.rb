require_relative "gameboard.rb"
require_relative "player.rb"


class Game

	@newboard = GameBoard.new()

	def initialize(p1,p2)
		@player1 = p1
		@player2 = p2
	end



	def play()
		a = 0
		until a == 5 do
			puts "hello"
			a += 1
		end

	end

end

playerX = Player.new("X")
playerO = ComputerRandom.new("O")
game = Game.new(playerX, playerO)

game.play()


