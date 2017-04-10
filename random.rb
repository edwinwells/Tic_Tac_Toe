require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"


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
				newgame.get_player_move("X")
				newgame.game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")
					
				puts "And..."
				puts "The computer moves!: "
				newgame.get_random_computer_player_move(newgame, "O")
				newgame.game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")	
			end
		end

		if response == "O"
			while newgame.check_full? == false ||
		  terminal.win == false do

				puts "And..."
				puts "The computer moves!: "
				newgame.get_random_computer_player_move(newgame, "X")
				newgame.game_flow_status_to_proceed_or_to_declare_tie_or_todeclare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")

				puts ""
				newgame.get_player_move("O")
				newgame.game_flow_status_to_proceed_or_to_declare_tie_or_todeclare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")					
			end
		end		
end
startgame()