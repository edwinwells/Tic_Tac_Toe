require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

	def test_for_a_board
		board = Board.new

		result=Array.new(9,"")
		assert_equal(result,board.board)
	end

end