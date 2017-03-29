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
		vacant_squares = Array.new

    	(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
	           	vacant_squares.push(key)
	        end
	    end
             
		square_sought = vacant_squares[0]
		set_position(square_sought, player_name)
		puts ""
	end

	def get_random_computer_player_move(terminal, newgame, player_name)

		vacant_squares = Array.new

    	(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
	           	vacant_squares.push(key)
	        end
	    end
	# .sample chooses a random index value from vacant_squares:            
		square_sought = vacant_squares.sample
		set_position(square_sought, player_name)
		puts ""
	end

	def get_unbeatable_computer_player_X_move(terminal, newgame, player_name)

		vacant_squares = Array.new
    	(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
	           	vacant_squares.push(key)
	        end
	     end
	    # puts vacant_squares.include?(:b2)
	    # p vacant_squares

	    square_sought = case vacant_squares.count
		#ideal first move for X is a corner square:
   			when 9
   				"a1"
		#ideal second move for X, if O has taken b2, is the opposite corner square:
   			when 7 
   				if vacant_squares.include?(:b2) == false
   					"c3"
		#alternatively, if O has taken a corner, X's second move should take any vacant corner:
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:c3) == false
   					"a3"
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:c1) == false
   					"c3"
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:a3) == false
   					"c3"
		#ideal second move for X, if O has taken a2, b3, b1, or c2, is b2:
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:a2) == false
   					"b2"
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:b3) == false
   					"b2"
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:b1) == false
   					"b2"
   				elsif vacant_squares.include?(:b2) == true && vacant_squares.include?(:c2) == false
   					"b2"
   				end

   			# when 7 
   			# 		elsif vacant_squares.include?("b2") == true && vacant_squares.include?("c3") == false then "a3"
   			# 		elsif vacant_squares.include?("b2") == true && vacant_squares.include?("a3") == false then "c3"
   			# 		# end
   			# 	end
   		end				
			# puts vacant_squares.count
			# puts square_sought
			set_position(square_sought, player_name)
	        # p vacant_squares
			puts ""
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