require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_for_a_board
		board = Board.new
		result=Array.new(9,"")
		assert_equal(result,board.board)
	end

	def test_for_X_at_index_0
		board = Board.new
		board.set_position(0,"X")
		result=["X", "", "", "", "", "", "", "", ""]
		assert_equal(result,board.board)
	end

	def test_for_O_at_index_4
		board = Board.new
		board.set_position(0,"X")
		board.set_position(4,"O")
		result=["X", "", "", "", "O", "", "", "", ""]
		assert_equal(result,board.board)
	end	

	def test_for_X_at_index_8
		board = Board.new
		board.board = ["X", "", "", "", "O", "", "", "", ""]
		board.set_position(8,"X")
		result=["X", "", "", "", "O", "", "", "", "X"]
		assert_equal(result,board.board)
	end		
end