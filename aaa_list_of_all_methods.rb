=begin

In game.rb:
	initialize(p1, p2, reset)
	check_for_wins(currentBoard, player_name)
	get_move(currentgame, player_name)
	game_flow_status_to_proceed_or_to_declare_tie_or_to_declare_win_and_if_to_reset_to_new_game(terminal, newgame, player_name)
	ask_to_reset_game()
	declare_tie(terminal, newgame)

	In all game.rb sub-classes:
	run_game(playerX, playerO, response)

********************************************************

In gameboard.rb:
	initialize()
	set_position(position, character)
	check_position?(position)
	check_full?()

********************************************************

In player.rb:
	initialize(input_name)

	In all game.rb sub-classes:
	get_move(newgame, player_name)

********************************************************

In human_v_human.rb:
	startgame()

=end