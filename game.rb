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



	def play()
		a = 0
		until a == 5 do
			puts "hello"
			a += 1
		end

	end

	def run_game(playerX, playerO, response)

	p playerX
	p playerO
	p game
	newgame = GameBoard.new
	p newgame
	terminal = Terminal.new
	@win = false
	@reset = "N"
	p terminal


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
			while newgame.check_full? == false ||
		  @win == false do

				puts "And..."
				puts "The computer moves!: "
				playerX.get_random_computer_player_move(newgame, "X")
				game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "X")	

				  # if @win == true
				  # 	break
				  # end

				puts ""
				get_player_move(newgame, "O")
				game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, "O")
			end
	 		if (terminal.win == true)
				   	ask_to_reset_game()
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
		terminal.showboard(newgame.setup)
		terminal.check_for_wins(newgame.setup, player_name)

		if ((terminal.win == false) &&
		   (newgame.check_full? == true))
				declare_tie(terminal, newgame)
				ask_to_reset_game()
	    end
		# terminal.showboard(newgame.setup)
 	end

	def ask_to_reset_game()
		@win = true
	    print "\n Care for another game? (Y or N) "
		@reset = gets.chomp
	end

	def declare_tie(terminal, newgame)
		print " The game is tie!"
		puts ""
		# terminal.showboard(newgame.setup)
	end

end

# playerX = Player.new("X")
# playerO = ComputerRandom.new("O")
# game = Game.new(game, playerX, playerO)
# @newboard = GameBoard.new()
# response = "X"
# game.run_game(playerX, playerO, response)