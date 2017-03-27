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

	def get_sequential_computer_player_move(terminal, newgame, player_name)
		square_sought = ""

		(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
           	   newgame.setup[key] = "#{player_name}"
           	   square_sought = newgame.setup[key]
           	   break
        	end                
      	end

		# newgame.each do |square, marker|
		#   if "#{square}"
		#   puts "#{key}-----"
		#   puts array
		# end

		# until check_position?(square) == true do
  #       	print " Invalid entry! Try again..."
		# 	puts ""
		# 	print " #{player_name}, enter your square! "
		# 	square = gets.chomp
		# end

		set_position(square_sought, player_name)
		puts ""
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