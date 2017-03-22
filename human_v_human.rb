require_relative "board.rb"
require_relative "terminal.rb"

newgame = Board.new
terminal = Terminal.new




		win = false
		until newgame.check_full? == true ||
			  win == true do

			print newgame.setup
			puts ""

			newgame.get_X(newgame)
			terminal.rows(newgame.setup)
			newgame.get_O(newgame)
			terminal.rows(newgame.setup)
		end

		# def get_X()
		# 	print "X, enter your square!"
		# 	square = gets.chomp

		# 	until newgame.check_position?(square) == true do
	 #        	print "Invalid entry! Already occupied."
		# 		puts ""
		# 		print "X, enter your square!"
		# 		square = gets.chomp
		# 	end

		# 	newgame.set_position(square,"X")
		# 	puts ""
		# 	print newgame.setup
		# 	puts ""
		# end

		# def get_O()
		# 	print "O, enter your square!"
		# 	square = gets.chomp

		# 	until newgame.check_position?(square) == true do
	 #        	print "Invalid entry! Already occupied."
		# 		puts ""
		# 		print "O, enter your square!"
		# 		square = gets.chomp
		# 	end

		# 	newgame.set_position(square,"O")
		# 	puts ""
		# 	print newgame.setup
		# 	puts ""
		# end