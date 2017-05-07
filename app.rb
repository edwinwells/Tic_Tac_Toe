require 'sinatra'
require_relative "unbeatable.rb"
require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"

# enable :sessions
# get '/' do
# 	erb :get_name
# end

# post '/name' do
# 	name = params[:user_name]
# 	erb :get_location, :locals => {:name => name}
# end



get '/' do
    erb :initial_page
end

get '/X' do

	playerX = Player.new("X")
	playerO = ComputerUnbeatable.new("O")
	reset = "N"
	@freshgame = VersusUnbeatable.new(playerX, playerO, reset)

	freshgame = {
			     a1: " ", a2: " ", a3: " ",
			     b1: " ", b2: " ", b3: " ",
			     c1: " ", c2: " ", c3: " "
		         }

    erb :User_Chooses_X, :locals => {:freshgame => freshgame}
end

get '/O' do
    erb :User_Chooses_O
end



post '/humanX(move1)' do
	# current_game.set_position
# post '/hxone' do
# 	name = params[:user_name]
# 	erb :get_location, :locals => {:name => name}
# end


	# @setup[:"#{position}"] = character

	move1 = params[:move1]
	freshgame = params[:freshgame]
    position = params[:move1]
    playerX = params[:playerX]
    playerO = params[:playerO]

    # freshgame = freshgame

 #    a1 = freshgame[:a1]
 #    b1 = freshgame[:b1]
 #    c1 = freshgame[:c1]
 #    a2 = freshgame[:a2]
 #    b2 = freshgame[:b2]
 #    c2 = freshgame[:c2]
 #    a3 = freshgame[:a3]
 #    b3 = freshgame[:b3]
 #    c3 = freshgame[:c3]



	# if position != "a1" ||
	# 	position != "a2" ||
	# 	position != "a3" ||
	# 	position != "b1" ||
	# 	position != "b2" ||
	# 	position != "b3" ||
	# 	position != "c1" ||
	# 	position != "c2" ||
	# 	position != "c3"
	# 	puts "Invalid entry! Please try again."
	# end

    erb :ComputerO_move1, :locals => {:move1 => move1, :freshgame => freshgame}

 get '/humanX(move2)' do 

 end
end