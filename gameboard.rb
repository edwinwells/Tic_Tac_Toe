class GameBoard

	attr_accessor :setup

	def initialize()
		@setup = {
			     a1: " ", a2: " ", a3: " ",
			     b1: " ", b2: " ", b3: " ",
			     c1: " ", c2: " ", c3: " "
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

	def get_unbeatable_computer_player_O_move(terminal, newgame, player_name)

	end	


	def game_status(terminal, newgame, player_name)
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

	def reset_game?()
	  print "\n Care for another game? (Y or N) "
	  again = gets.chomp
		  if again.downcase == "y"
		  	startgame()
		  else 
		  	exit
		  end	  
	end

	def declare_tie(terminal, newgame)
		print " The game is tie!"
		puts ""
		terminal.showboard(newgame.setup)
	end
end