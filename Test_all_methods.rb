require "minitest/autorun"
require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "game.rb"

class Testallmethods < Minitest::Test

	# def test_nothing_present_except_integers_true
	# 	isbn_string="0123456789"
	# 	assert_equal(true,remove_unwanted(isbn_string))
	# end

	# def test_for_new_board
	# 	player = Sequential.new(null)
	# 	move = player.get_move()
	# 	assert_equal(result,board.setup)
	# end

	# def test_for_O_at_b2
	# 	board = GameBoard.new
	# 	board.set_position(:b2, "O")
	# 	result = {:b2 => "O"}		
	# 	assert_equal(result,board.setup)
	# end		

# In game.rb:


=begin	
https://www.ruby-forum.com/topic/267209

In game.rb:
	initialize(p1, p2, reset)
	check_for_wins(currentBoard, player_name)
	get_move(currentgame, player_name)
	game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, player_name)
	ask_to_reset_game()
	declare_tie(terminal, newgame)

	In all game.rb sub-classes:
	run_game(playerX, playerO, response)

=end

# ********************************************************

# In gameboard.rb:
# 	initialize()
#X 	set_position(position, character)
#X 	check_position?(position)
#X 	check_full?()


# 	initialize() method:
	def test_params_of_initialized_board
		board = GameBoard.new
		result = {
			     a1: " ", a2: " ", a3: " ",
			     b1: " ", b2: " ", b3: " ",
			     c1: " ", c2: " ", c3: " "
		         }
		assert_equal(board.setup,result)
	end

# 	set_position(position, character) method:
	def test_returns_true_if_specific_square_which_is_vacant_at_initialize_is_populated_after_set_position_method_invoked
		board = GameBoard.new
		board.set_position(:b1, "X")
		result = board.setup
		assert_equal({
			     a1: " ", a2: " ", a3: " ",
			     b1: "X", b2: " ", b3: " ",
			     c1: " ", c2: " ", c3: " "
		         },result)
	end

 #  check_position?(position) method:	
	def test_returns_true_if_specific_square_vacant
		board = GameBoard.new
		board.set_position(:c1, " ")
		result = board.check_position?(:c1)
		assert_equal(true,result)
	end

	def test_returns_false_if_specific_square_already_occupied
		board = GameBoard.new
		board.set_position(:a1, "X")
		result = board.check_position?(:a1)
		assert_equal(false,result)
	end

#   check_full?() method:	

	def test_returns_false_if_any_square_vacant
		board = GameBoard.new
		# board.set_position(:c1, " ")
		result = board.check_full?()
		assert_equal(false,result)
	end

	def test_returns_true_if_all_squares_occupied
		board = GameBoard.new
		board.setup = {
			     a1: "X", a2: "O", a3: "X",
			     b1: "O", b2: "X", b3: "O",
			     c1: "O", c2: "X", c3: "O"
		         }
		result = board.check_full?()
		assert_equal(true,result)
	end

# ********************************************************



















end
