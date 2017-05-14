require 'sinatra'
require_relative "unbeatable_web.rb"
require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "game.rb"
require_relative "human_v_human.rb"


class TicTacToeweb < Sinatra::Base
enable :sessions

get '/' do
    erb :initial_page
end

get '/twohumans' do
	session[:playerX] = Player.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = HumanVersusHuman.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

post '/get_move' do

	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]
	reset = params[:reset]
	value = params[:value]

     if params[:value] == "a3"
     	gameboard.setup[:a3] = "X"
     elsif params[:value] == "b3"
     	gameboard.setup[:b3] = "X"
     elsif params[:value] == "c3"
     	gameboard.setup[:c3] = "X"
     elsif params[:value] == "a2"
     	gameboard.setup[:a2] = "X"
     elsif params[:value] == "b2"
     	gameboard.setup[:b2] = "X"
     elsif params[:value] == "c2"
     	gameboard.setup[:c2] = "X"
     elsif params[:value] == "a1"
     	gameboard.setup[:a1] = "X"
     elsif params[:value] == "b1"
     	gameboard.setup[:b1] = "X"
     elsif params[:value] == "c1"
     	gameboard.setup[:c1] = "X"
     end

	# redirect "/Invalid_Move" if session[:gameboard].check_position?(square) == false
	# session[:gameboard] = session[:gameboard].set_position(square, "X")



    erb :Basic_Table2, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], value: value}

end

get '/show_move' do

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}


end


get '/leveloneHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerSequential.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusSequential.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
end

get '/leveloneHumanO' do
	session[:playerX] = ComputerSequential.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusSequential.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
end

get '/leveltwoHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerRandom.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusRandom.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
end

get '/leveltwoHumanO' do
	session[:playerX] = ComputerRandom.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusRandom.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
end

get '/levelthreeHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerUnbeatable.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
end

get '/levelthreeHumanO' do
	session[:playerX] = ComputerUnbeatable.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
end



get '/Invalid_Move' do
    erb :Invalid_Move, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

# get '/X' do
# 	session[:playerX] = Player.new("X")
# 	session[:playerO] = ComputerUnbeatable.new("O")
# 	session[:reset] = "N"	
# 	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
# 	session[:gameboard] = GameBoard.new


#     erb :HumanX_move, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# get '/O' do
# 	session[:playerO] = Player.new("O")
# 	session[:playerX] = ComputerUnbeatable.new("winnerX")
# 	session[:reset] = "N"	
# 	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
# 	session[:gameboard] = GameBoard.new

# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]

# 	session[:playerX].get_unbeatable_computer_player_X_move(session[:gameboard], "X")


#     erb :HumanO_move, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end



# post '/HumanX_move' do
# 	# current_game.set_position

# 	# @setup[:"#{position}"] = character

# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]


#     erb :ComputerO_move, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# post '/ComputerO_move' do

# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]

# 	session[:gameboard].set_position(move, "X")

# 	session[:playerO].get_unbeatable_computer_player_O_move(session[:gameboard], "O")

#     erb :ComputerO_move, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# post '/ComputerX_move' do

# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]


# 	redirect "/Invalid_Move_For_O" if session[:gameboard].check_position?(move) == false
# 	session[:gameboard].set_position(move, "O")

# 	session[:playerX].get_unbeatable_computer_player_X_move(session[:gameboard], "X")

#     erb :ComputerX_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# get '/HumanX_balance' do
#     erb :HumanX_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# get '/HumanO_balance' do
#     erb :HumanO_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# post '/HumanX_balance' do
# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]

# 	redirect "/Invalid_Move_For_X" if session[:gameboard].check_position?(move) == false

# 	session[:gameboard].set_position(move, "X")

# 	redirect "/winnerX" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true


# 	session[:playerO].get_unbeatable_computer_player_O_move(session[:gameboard], "O")

# 	redirect "/winnerO" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true

#     erb :ComputerO_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# post '/HumanO_balance' do
# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]

# 	redirect "/Invalid_Move_For_O" if session[:gameboard].check_position?(move) == false

# 	session[:gameboard].set_position(move, "O")

# 	redirect "/winnerO" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true

# 	session[:playerX].get_unbeatable_computer_player_X_move(session[:gameboard], "X")

# 	redirect "/winnerX" if session[:freshgame].check_for_wins(session[:gameboard].setup, "X") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true

#     erb :ComputerX_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# post '/ComputerO_balance' do

# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]

# 	redirect "/Invalid_Move_For_X" if session[:gameboard].check_position?(move) == false

# 	session[:gameboard].set_position(move, "X")
# 	redirect "/winnerX" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true


# 	session[:playerO].get_unbeatable_computer_player_O_move(session[:gameboard], "O")
# 	redirect "/winnerO" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true

#     erb :ComputerO_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# post '/ComputerX_balance' do

# 	move = params[:move]
# 	freshgame = params[:freshgame]
#     playerX = params[:playerX]
#     playerO = params[:playerO]
#     gameboard = params[:gameboard]


# 	session[:gameboard].set_position(move, "O")
# 	redirect "/winnerO" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true


# 	session[:playerX].get_unbeatable_computer_player_X_move(session[:gameboard], "X")
# 	redirect "/winnerX" if session[:freshgame].check_for_wins(session[:gameboard].setup, "X") == true
# 	redirect "/drawn_game" if session[:gameboard].check_full?() == true

#     erb :ComputerX_balance, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# get "/winnerO" do
# 		erb:win_for_O, :locals => {gameboard: session[:gameboard]}
# end

# get "/winnerX" do
# 		erb:win_for_X, :locals => {gameboard: session[:gameboard]}
# end

# get "/drawn_game" do
# 	erb:Drawn_game, :locals => {gameboard: session[:gameboard]}
# end

# get "/Invalid_Move_For_X" do
# 	erb:Invalid_Move_For_X, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

# get "/Invalid_Move_For_O" do
# 	erb:Invalid_Move_For_O, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
# end

end