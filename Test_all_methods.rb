require "minitest/autorun"
require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "game.rb"

class Testvalidisbn < Minitest::Test

	# def test_nothing_present_except_integers_true
	# 	isbn_string="0123456789"
	# 	assert_equal(true,remove_unwanted(isbn_string))
	# end

	# def test_for_new_board
	# 	player = Sequential.new(null)
	# 	move = player.get_move()
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

end
