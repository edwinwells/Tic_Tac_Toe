=begin

In game.rb:
	initialize(p1, p2, reset)
	check_for_wins(currentBoard, player_name)

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