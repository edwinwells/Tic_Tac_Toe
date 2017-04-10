require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "terminal.rb"


class Game

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

	def run_game(playerX, playerO)

	p playerX
	p playerO
	newgame = GameBoard.new
	p newgame
	terminal = Terminal.new
	p terminal
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
				get_player_move(newgame, "X")
				game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")
					
				puts "And..."
				puts "The computer moves!: "
				playerO.get_random_computer_player_move(newgame, "O")
				game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")	
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
				get_player_move(newgame,"O")
				newgame.game_flow_status_to_proceed_or_to_declare_tie_or_todeclare_win_and_if_to_reset_to_new_game(terminal, newgame, playerO)					
			end
		end		
	end

	def get_player_move(currentgame, player_name)
		print " #{player_name}, enter your square! "
		square = gets.chomp

		until currentgame.check_position?(square) == true do
        	print " Invalid entry! Try again..."
			puts ""
			print " #{player_name}, enter your square! "
			square = gets.chomp
		end

		currentgame.set_position(square, player_name)
		puts ""
	end

	def game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, player_name)
		terminal.check_for_wins(newgame.setup, player_name)

		if ((terminal.win == false) &&
		   (newgame.check_full? == true))
				declare_tie(terminal, newgame)
				reset_game?()
	    end
		terminal.showboard(newgame.setup)

		if ((terminal.win == true) ||
			(newgame.check_full? == true)) ||
		   ((newgame.check_full? == true) &&
		    (terminal.win == false))

				reset_game?()
		end	
	end

end

playerX = Player.new("X")
playerO = ComputerRandom.new("O")
game = Game.new(playerX, playerO)
@newboard = GameBoard.new()

game.run_game(playerX, playerO)


