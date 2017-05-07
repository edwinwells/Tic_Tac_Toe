require 'sinatra'
require_relative "unbeatable_web.rb"
require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"

class TicTacToeweb < Sinatra::Base
enable :sessions

get '/' do
    erb :initial_page
end

get '/X' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerUnbeatable.new("O")
	session[:reset] = "N"	
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new


    erb :HumanX_move, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

get '/O' do

	session[:playerO] = Player.new("O")
	session[:playerX] = ComputerUnbeatable.new("X")
	session[:reset] = "N"	
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new	
    erb :HumanO_move
end



post '/humanX_move' do
	# current_game.set_position

	# @setup[:"#{position}"] = character

	move = params[:move]
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]

	session[:gameboard].set_position(move, "X")

    erb :ComputerO_move, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

post '/ComputerO_move' do
	# current_game.set_position

	# @setup[:"#{position}"] = character

	move = params[:move]
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]

	session[:playerO].get_unbeatable_computer_player_O_move(session[:gameboard], "O")
	# session[:gameboard].set_position(move, "O")

    erb :ComputerO_move, :locals => {:move => session[:move], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

end