require_relative "gameboard.rb"


class Player

	def initialize(input_name)
		@player = input_name
	end

end

class ComputerSequential < Player

	def get_sequential_computer_player_move(newgame, player_name)
		vacant_squares = Array.new

    	(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
	           	vacant_squares.push(key)
	        end
	    end
             
		square_sought = vacant_squares[0]
		newgame.set_position(square_sought, player_name)
		puts ""
	end

end

class ComputerRandom < Player

	def get_random_computer_player_move(newgame, player_name)

		vacant_squares = Array.new

    	(newgame.setup).each do |key, value|
	 		if newgame.setup[key] == " "
	           	vacant_squares.push(key)
	        end
	    end
	# .sample chooses a random index value from vacant_squares:            
		square_sought = vacant_squares.sample
		newgame.set_position(square_sought, player_name)
		puts ""
	end
end

class ComputerUnbeatable < Player

	def get_unbeatable_computer_player_X_move(newgame, player_name)

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

		# if then O takes an edge, then X must block, and this will force O to block next move:
   			when 5
   				if newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O"}
   					"a2"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O",}
   					"b1"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O",}
   					"c2"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O",}
   					"b3"
   		#if O has taken a corner on his first move (weakest,) and X has taken an additional corner (strongest,) X will win by taking the last corner, creating a "fork":
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", a2: "O"}
   					"c1"
   				elsif newgame.setup >= {a1: "X", c1: "O", c3: "X", b2: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b2: "O"}
   					"c1"
   		#or if O misses the block:
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", a2: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b3: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", c2: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", c1: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b1: "O"}
   					"b2"
   		#if O starts with an edge, then misses a block:
   				elsif newgame.setup >= {a1: "X", a3: "O", b2: "X", a2: "O"}
   					"c3"
   				elsif newgame.setup >= {a1: "X", a3: "O", b2: "X", b3: "O"}
   					"c3"
   				elsif newgame.setup >= {a1: "X", a3: "O", b2: "X", c2: "O"}
   					"c3"
   				elsif newgame.setup >= {a1: "X", a3: "O", b2: "X", c1: "O"}
   					"c3"
   				elsif newgame.setup >= {a1: "X", a3: "O", b2: "X", b1: "O"}
   					"c3"
   				elsif newgame.setup >= {a1: "X", c1: "O", c3: "X", c2: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c1: "O", c3: "X", b1: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c1: "O", c3: "X", b3: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c1: "O", c3: "X", a3: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c1: "O", c3: "X", a2: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c3: "O", b2: "X", b3: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", c3: "O", b2: "X", a3: "O"}
   					"b3"
   				elsif newgame.setup >= {a1: "X", c3: "O", b2: "X", a2: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", c3: "O", b2: "X", c2: "O"}
   					"c1"
   				elsif newgame.setup >= {a1: "X", c3: "O", b2: "X", c1: "O"}
   					"c2"
   				elsif newgame.setup >= {a1: "X", c3: "O", b2: "X", b1: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", c1: "O"}
   					"a2"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", c2: "O"}
   					"a2"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", b3: "O"}
   					"a2"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", b2: "O"}
   					"a2"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", b3: "O"}
   					"b1"
   				end

   		#if O does not block, X wins:
   			when 3
   		#after X has played a2:
   				if newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O", a2: "X", b3: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O", a2: "X", b1: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O", a2: "X", c1: "O"}
   					"a3"
   		#after X has played b1:
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O", b1: "X", a3: "O"}
   					"c1"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O", b1: "X", a2: "O"}
   					"c1"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O", b1: "X", c2: "O"}
   					"c1"
   		#after X has played b3:
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O", b3: "X", a2: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O", b3: "X", c2: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O", b3: "X", c1: "O"}
   					"a3" 
   		#after X has played c2:
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O", c2: "X", a3: "O"}
   					"c1" 
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O", c2: "X", b3: "O"}
   					"c1" 
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O", c2: "X", b1: "O"}
   					"c1" 
   		#but if O blocks, X in turn must block:
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O", a2: "X", a3: "O"}
   					"c1"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O", b1: "X", c1: "O"}
   					"a3"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O", b3: "X", a3: "O"}
   					"c1"
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O", c2: "X", c1: "O"}
   					"a3"

   		#following weakest play by O (cf above,) X wins thru' the fork:
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", a2: "O", c1: "X", b3: "O"}
   					"b1"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", a2: "O", c1: "X", b2: "O"}
   					"b1"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", a2: "O", c1: "X", b1: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", c3: "O", a3: "X", a2: "O", c1: "X", c2: "O"}
   					"b2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b2: "O", c1: "X", c2: "O"}
   					"b1"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b2: "O", c1: "X", b1: "O"}
   					"c2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b2: "O", c1: "X", a2: "O"}
   					"c2"
   				elsif newgame.setup >= {a1: "X", a3: "O", c3: "X", b2: "O", c1: "X", b3: "O"}
   					"c2"






   				end

   		#finally, O must either block, or lose:
   			when 1
   				if newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O", a2: "X", a3: "O", c1: "X", b1: "O"}
   					"b3"#DRAW
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", c2: "O", a2: "X", a3: "O", c1: "X", b3: "O"}
   					"b1"#X WINS
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O", b1: "X", c1: "O", a3: "X", a2: "O"}
   					"c2"#DRAW
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b3: "O", b1: "X", c1: "O", a3: "X", c2: "O"}
   					"a2"#X WINS
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O", c2: "X", c1: "O", a3: "X", b3: "O"}
   					"b1"#DRAW
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", a2: "O", c2: "X", c1: "O", a3: "X", b1: "O"}
   					"b3"#X WINS
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O", b3: "X", a3: "O", c1: "X", c2: "O"}
   					"a2"#DRAW
   				elsif newgame.setup >= {a1: "X", b2: "O", c3: "X", b1: "O", b3: "X", a3: "O", c1: "X", a2: "O"}
   					"c2"#X WINS
   				end

   		end				
			# puts vacant_squares.count
			# puts square_sought
			newgame.set_position(square_sought, player_name)
	        # p vacant_squares
			puts ""
	end

	def get_unbeatable_computer_player_O_move(newgame, player_name)
	end

end