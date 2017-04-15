require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"


def startgame()
newgame = GameBoard.new
terminal = Terminal.new

	while newgame.check_full? == false ||
		  game.win == false do

		puts ""
		newgame.get_player_move("X")
		newgame.game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")
			
		puts ""
		newgame.get_player_move("O")
		newgame.game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")	

	end
end
startgame()