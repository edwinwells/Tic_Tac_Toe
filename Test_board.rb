require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_for_a_board
		board = Board.new
		result=Hash.new
		assert_equal(result,board.setup)
	end

	def test_for_X_at_a1
		board = Board.new
		board.set_position(:a1, "X")
		result = {:a1 => "X"}
		assert_equal(result,board.setup)
	end

	def test_for_O_at_b2
		board = Board.new
		board.set_position(:b2, "O")
		result = {:b2 => "O"}		
		assert_equal(result,board.setup)
	end	

	def test_for_X_at_c3
		board = Board.new
		board.set_position(:c3, "X")
		result = {:c3 => "X"}		
		assert_equal(result,board.setup)
	end		

	def test_returns_false_if_space_already_occupied
		board = Board.new
		board.set_position(:c1, "X")
		result = board.check_position?(:c1)
		assert_equal(false,result)
	end	

	# def test_empty_spot
	# 	board = Board.new
	# 	board.setup = ["X", "", "", "", "O", "", "", "X", ""]
	# 	result = board.check_position?(1)
	# 	assert_equal(true,result)
	# end

	# def test_attempted_new_spot_at_already_occupied_returns_false
	# 	board = Board.new
	# 	board.setup = ["X", "O", "", "", "O", "", "X", "X", "X"]
	# 	result = board.check_position?(1)
	# 	assert_equal(false, result)
	# end

	# def test_an_attempted_second_new_spot_at_already_occupied_returns_false
	# 	board = Board.new
	# 	board.setup = {:a1 => "X", :a2 => "O", :a3 => "",
	# 	               :b1 => "", :b2 => "O", :b3 => "",
	# 	               :c1 => "X", :c2 => "X", :c3 => "X"
	# 	              }
	# 	 result = board.check_position?(15)
	# 	 assert_equal(false,result)
	# 	end

	# 	def test_full_board_equals_game_over
	# 		board = Board.new

	# 		board.setup = ["X", "O", "O", "O", "O", "X", "X", "X", "X"]
	# 		assert_equal(true, board.check_full?)
	# 	end

	# 	def test_almost_full_board_returns_false_for_check_full?
	# 		board = Board.new
	# 		board.setup = ["X", "X", "O", "O", "O", "", "X", "X", "X"]
	# 		assert_equal(false,board.check_full?)
	# 	end 

	# 	def test_if_board_is_empty_returns_false_for_check_full?
	# 		board=Board.new
	# 		board.setup = ["", "", "", "", "", "", "", "", ""]
	# 		assert_equal(false,board.check_full?)
	# 	end
end