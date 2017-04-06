class Player

	def initialize(input_name)
		@player = input_name
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
end

class ComputerSequential < Player

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

end

class ComputerRandom < Player

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
end

class ComputerUnbeatable < Player

	def get_unbeatable_computer_player_X_move(terminal, newgame, player_name)

		vacant_squares = Array.new
    	(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
	           	vacant_squares.push(key)
	        end
	     end
	    # puts vacant_squares.include?(:b2)
	    # p vacant_squares
	    # p newgame.setup

	    square_sought = case vacant_squares.count
		#ideal first move for X is a corner square:
   			when 9
   				"a1"
		#ideal second move for X, if O has taken b2, is the opposite corner square:
   			when 7
   				if newgame.setup >= {a1: "X", b2: "O"}
   					"c3"
		#alternatively, if O has taken a corner, X's second move should take any vacant corner:
   				elsif newgame.setup >= {a1: "X", c3: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", c1: "O"}
   					"c3"
   				elsif newgame.setup >= {a1: "X", a3: "O"}
   					"c3"
		#ideal second move for X, if O has taken a2, b3, b1, or c2, is b2:
   				elsif newgame.setup >= {a1: "X", a2: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", b3: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", b1: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c2: "O"}
   					"b2"
   				end

   		end				
			# puts vacant_squares.count
			# puts square_sought
			set_position(square_sought, player_name)
	        # p vacant_squares
			puts ""
	end
end