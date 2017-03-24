require_relative "board.rb"
require_relative "terminal.rb"

def startgame()
newgame = Board.new
terminal = Terminal.new


	 	newgame.setup = terminal.rows(newgame.setup)

		while newgame.check_full? == false ||
			  terminal.win == false do

			puts ""
			newgame.get_player_move("X")
			newgame.game_status(terminal, newgame)
				
			puts ""
			newgame.get_player_move("O")
			newgame.game_status(terminal, newgame)	

		end
end
startgame()