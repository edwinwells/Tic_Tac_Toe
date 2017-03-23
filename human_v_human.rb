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
			newgame.game_status(terminal, newgame)	

			newgame.get_O()
			newgame.game_status(terminal, newgame)	

		end
end
startgame()