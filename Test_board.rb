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

	def test_empty_spot
		board = Board.new
		board.setup = ["X", "", "", "", "O", "", "", "X", ""]
		result = board.check_position?(1)
		assert_equal(true,result)
	end

	def test_attempted_new_spot_at_already_occupied_returns_false
		board = Board.new
		board.setup = ["X", "O", "", "", "O", "", "X", "X", "X"]
		result = board.check_position?(1)
		assert_equal(false, result)
	end

	def test_an_attempted_second_new_spot_at_already_occupied_returns_false
		board = Board.new
		board.setup = ["X", "O", "", "", "O", "", "X", "X", "X"]
		 result = board.check_position?(15)
		 assert_equal(false,result)
		end

		def test_full_board_equals_game_over
			board = Board.new

			board.setup = ["X", "O", "O", "O", "O", "X", "X", "X", "X"]
			assert_equal(true, board.check_full?)
		end

		def test_almost_full_board_returns_false_for_check_full?
			board = Board.new
			board.setup = ["X", "X", "O", "O", "O", "", "X", "X", "X"]
			assert_equal(false,board.check_full?)
		end 

		def test_if_board_is_empty_returns_false_for_check_full?
			board=Board.new
			board.setup = ["", "", "", "", "", "", "", "", ""]
			assert_equal(false,board.check_full?)
		end
end