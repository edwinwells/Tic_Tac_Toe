class Board

	attr_accessor :setup

	def initialize()
		@setup = {
			     a1: "", a2: "", a3: "",
			     b1: "", b2: "", b3: "",
			     c1: "", c2: "", c3: ""
		         }

	end

	def set_position(position, character)
		@setup[:"#{position}"] = character
	end

	def check_position?(position)
		if @setup[:"#{position}"] == " "
			true
		else
			false
		end
	end	

	def check_full?()
		count = 0
		@setup.each do |key, value|
	 		if setup[key] != " "
           	   count += 1
        	end
        end

        if count <9 then false else true end
    end

		def get_player_move(player_name)
			print " #{player_name}, enter your square! "
			square = gets.chomp

			until check_position?(square) == true do
	        	print " Invalid entry! Try again..."
				puts ""
				print " #{player_name}, enter your square! "
				square = gets.chomp
			end

			set_position(square, player_name)
			puts ""
		end

		def game_status(terminal, newgame, player_name)
			terminal.check_for_wins(newgame.setup, player_name)
			terminal.showboard(newgame.setup)
			if newgame.check_full? == true &&
					  terminal.win == false
				print " The game is tie!"
				if reset_game? == true
					startgame()
				else 
					exit			
				end
			end		

			if	  terminal.win == true
				if reset_game? == true
					startgame()
				else 
					exit			
				end
			end	
		end

		def reset_game?()
		  print "\n Care for another game? (Y or N) "
		  again = gets.chomp
			  if again.downcase == "y"
			  	true
			  else 
			  	false
			  end
		end
end