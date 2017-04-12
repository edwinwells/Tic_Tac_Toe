require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "terminal.rb"
# require_relative "random.rb"

class Game

	attr_accessor :game
	attr_accessor :reset


	def initialize(game, p1, p2, again)
		@game = game
		@player1 = p1
		@player2 = p2
		@reset = reset

	end


	def run_game(playerX, playerO, response)

	# p playerX
	# p playerO
	# p game
	newgame = GameBoard.new
	# p newgame
	terminal = Terminal.new
	@win = false
	@reset = "N"
	# p terminal


		if response == "X"
			while @win == false do

				puts ""
				if @win == false
					get_player_move(newgame, "X")
					game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")
				end
				# p @win
				#   if @win == true
				#   	break
				#   end	
				if @win == false
					puts "And..."
					puts "The computer moves!: "
					playerO.get_random_computer_player_move(newgame, "O")
					game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")	
				end
		 		if (terminal.win == true)
					   	ask_to_reset_game()
				end	
			end
		end

		if response == "O"
			while terminal.win == false do

				puts ""
				if terminal.win == false
					puts "And..."
					puts "The computer moves!: "
					playerX.get_random_computer_player_move(newgame, "X")
					game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")	
				end

				puts ""
				if terminal.win == false
					get_player_move(newgame, "O")
					game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")
				end
			end
	 	# 	if (terminal.win == true)
			# 	   	ask_to_reset_game()
			# end	
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
		terminal.showboard(newgame.setup)
		p player_name
		terminal.check_for_wins(newgame.setup, player_name)
		p @win
		p terminal.win

		if ((terminal.win == false) &&
		   (newgame.check_full? == true))
				terminal.win = true
				p terminal.win
				declare_tie(terminal, newgame)
		elsif terminal.win == true
			ask_to_reset_game()

	    end

 	end

	def ask_to_reset_game()
		# terminal.win = true
		# @win = true
	    print "\n Care for another game? (Y or N) "
		@reset = gets.chomp
	end

	def declare_tie(terminal, newgame)
		# win = true
		print " The game is tie!"
		puts ""
		ask_to_reset_game()
		# terminal.showboard(newgame.setup)
	end

end

# playerX = Player.new("X")
# playerO = ComputerRandom.new("O")
# game = Game.new(game, playerX, playerO)
# @newboard = GameBoard.new()
# response = "X"
# game.run_game(playerX, playerO, response)