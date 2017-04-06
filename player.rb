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


end

class ComputerRandom < Player


end

class ComputerUnbeatable < Player

	
end