require_relative "gameboard.rb"
require_relative "player.rb"


class Game

newboard = GameBoard.new()
playerX = Player.new("X")
playerO = ComputerRandom.new("O")

	def play()
		a = 0
		until a == 5 do
			puts "hello"
			a += 1
		end

	end

end

game = Game.new
game.play()


