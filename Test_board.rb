require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_for_a_board
		board = Board.new
		result=Array.new(9,"")
		assert_equal(result,board.setup)
	end

	def test_for_X_at_index_0
		board = Board.new
		board.set_position(0,"X")
		result=["X", "", "", "", "", "", "", "", ""]
		assert_equal(result,board.setup)
	end

	def test_for_O_at_index_4
		board = Board.new
		board.set_position(0,"X")
		board.set_position(4,"O")
		result=["X", "", "", "", "O", "", "", "", ""]
		assert_equal(result,board.setup)
	end	

	def test_for_X_at_index_8
		board = Board.new
		board.setup = ["X", "", "", "", "O", "", "", "", ""]
		board.set_position(8,"X")
		result=["X", "", "", "", "O", "", "", "", "X"]
		assert_equal(result,board.setup)
	end		

	def test_returns_false_if_space_already_occupied
		board = Board.new
		board.setup = ["X", "", "", "", "O", "", "", "", ""]		
		result = board.check_position?(0)
		assert_equal(false,result)
	end		
end