require_relative "board.rb"
require_relative "terminal.rb"

board = Board.new
terminal = Terminal.new

setup = {
		:a1 => "", :a2 => "", :a3 => "",
		:b1 => "", :b2 => "", :b3 => "",
		:c1 => "", :c2 => "", :c3 => ""
		}

terminal.rows(setup)

# terminal.showboard(board.set_position)

	while terminal.game_over?(setup) == false
		print "X, enter your square!"
		square = gets.chomp
		setup.set_position(square, "X")
		terminal.showboard(setup.set_position)
	if terminal.game_over?
		break
	end

		print "O enter your square!"
		square = gets.chomp
		board.set_position(square, "O")
		terminal.showboard(setup.set_position)
	end

	terminal.check_for_wins(setup)