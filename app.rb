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


    erb :User_Chooses_X, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

get '/O' do

	session[:playerO] = Player.new("O")
	session[:playerX] = ComputerUnbeatable.new("X")
	session[:reset] = "N"	
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new	
    erb :User_Chooses_O
end



post '/humanX(move1)' do
	# current_game.set_position

	# @setup[:"#{position}"] = character

	move1 = params[:move1]
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]

	session[:gameboard].set_position(move1, "X")

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

    erb :ComputerO_move1, :locals => {:move1 => session[:move1], playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard]}
end

 post '/humanX_move2' do
 	computermove1 = session[:computermove1] 
	move1 = session[:move1]
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]


    erb :humanX_move2, :locals => {:computermove1 => session[:computermove1], :move1 => session[:move1], :playerX => session[:playerX], :playerO => session[:playerO],:freshgame => session[:freshgame], :reset =>session[:reset]}
 end
end