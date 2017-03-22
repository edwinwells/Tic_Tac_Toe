require_relative "board.rb"
require_relative "terminal.rb"

setup = Board.new
terminal = Terminal.new

setup = {
			:a1 => "", :a2 => "", :a3 => "",
			:b1 => "", :b2 => "", :b3 => "",
			:c1 => "", :c2 => "", :c3 => ""
		  }


		print setup
		puts ""
		print "X, enter your square!"
		square = gets.chomp
		setup[:"#{square}"] = "X"
		puts ""
		print setup
		puts ""

		ready = 0
		until ready == 1 do
			print "O enter your square!"
			square = gets.chomp

			if setup[:"#{square}"] != ""
				print "Invalid entry! Already occupied."
				puts ""
				ready = 0
			else setup[:"#{square}"] = "O"
				ready = 1
			end
		end
				puts ""
		setup[:"#{square}"] = "O"

terminal.rows(setup)
# terminal.check_for_wins(setup)