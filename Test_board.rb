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

	def test_returns_true_if_space_is_vacant
		board = Board.new
		board.set_position(:c1, "")
		result = board.check_position?(:c1)
		assert_equal(true,result)
	end	

	def test_full_board_equals_true_for_check_full?
		board = Board.new
		board.setup = {
					   :a1 => "X", :a2 => "O", :a3 => "X",
					   :b1 => "O", :b2 => "X", :b3 => "O",
			           :c1 => "X", :c2 => "O", :c3 => "X"
		              }
		assert_equal(true, board.check_full?)
	end

	def test_NOTfull_board_equals_false_for_check_full?
		board = Board.new
		board.setup = {
					   :a1 => "X", :a2 => "O", :a3 => "X",
					   :b1 => "O", :b2 => "X", :b3 => "O",
			           :c1 => "", :c2 => "O", :c3 => "X"
		              }
		assert_equal(false, board.check_full?)
	end
 

	def test_empty_board_equals_false_for_check_full?
		board = Board.new
		board.setup = {
					   :a1 => "", :a2 => "", :a3 => "",
					   :b1 => "", :b2 => "", :b3 => "",
			           :c1 => "", :c2 => "", :c3 => ""
		              }
		assert_equal(false, board.check_full?)
	end
end