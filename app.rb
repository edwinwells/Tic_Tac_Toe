require 'sinatra'
require_relative "gameboard.rb"
require_relative "player.rb"
require_relative "game.rb"

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
	session[:gametype] = 1
	gametype = params[:gametype]
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/leveloneHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerSequential.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusSequential.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 2
	gametype = params[:gametype]

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/leveloneHumanO' do
	session[:playerX] = ComputerSequential.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusSequential.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 3
	gametype = params[:gametype]

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/leveltwoHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerRandom.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusRandom.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 4
	gametype = params[:gametype]

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/leveltwoHumanO' do
	session[:playerX] = ComputerRandom.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusRandom.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 5
	gametype = params[:gametype]

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/levelthreeHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerUnbeatable.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 6
	gametype = params[:gametype]

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/levelthreeHumanO' do
	session[:playerX] = ComputerUnbeatable.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 7
	gametype = params[:gametype]

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype]}
end
 
post '/moveX' do
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]
	reset = params[:reset]
	value = params[:value]
	gameboard = params["gameboard"]
	gametype = params[:gametype]
	vacant_squares = Array.new
	(session[:gameboard].setup).each do |key, value|
 		if (session[:gameboard].setup)[key] == " "
           	vacant_squares.push(key)
        end
    end
	if session[:gametype] == 3 ||
	   session[:gametype] == 5 ||
	   session[:gametype] == 7 
			session[:playerX].get_move(session[:gameboard],"X")
   	else
     if params["a3"] == "a3"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("a3") == false
     	session[:gameboard].set_position("a3", "X")
     elsif params["b3"] == "b3"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("b3") == false
     	session[:gameboard].set_position("b3", "X")
     elsif params["c3"] == "c3"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("c3") == false
     	session[:gameboard].set_position("c3", "X")
     elsif params["a2"] == "a2"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("a2") == false
     	session[:gameboard].set_position("a2", "X")
     elsif params["b2"] == "b2"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("b2") == false
     	session[:gameboard].set_position("b2", "X")
     elsif params["c2"] == "c2"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("c2") == false
     	session[:gameboard].set_position("c2", "X")
     elsif params["a1"] == "a1"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("a1") == false
     	session[:gameboard].set_position("a1", "X")
     elsif params["b1"] == "b1"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("b1") == false
     	session[:gameboard].set_position("b1", "X")
     elsif params["c1"] == "c1"
		redirect "/Invalid_Move_X" if session[:gameboard].check_position?("c1") == false
     	session[:gameboard].set_position("c1", "X")
     end     
    end
	redirect "/winnerX" if session[:freshgame].check_for_wins(session[:gameboard].setup, "X") == true
	redirect "/drawn_game" if session[:gameboard].check_full?() == true
    erb :Basic_Table2, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], value: value, gametype: session[:gametype]}
end

post '/moveO' do
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]
	reset = params[:reset]
	value = params[:value]
	gameboard = params["gameboard"]
	gametype = params[:gametype]

	vacant_squares = Array.new
	(session[:gameboard].setup).each do |key, value|
 		if (session[:gameboard].setup)[key] == " "
           	vacant_squares.push(key)
        end
    end	

	if session[:gametype] == 2 ||
	   session[:gametype] == 4 ||
	   session[:gametype] == 6 
			session[:playerO].get_move(session[:gameboard],"O") 
 	else
     if params["a3"] == "a3"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("a3") == false
     	session[:gameboard].set_position("a3", "O")
     elsif params["b3"] == "b3"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("b3") == false
     	session[:gameboard].set_position("b3", "O")
     elsif params["c3"] == "c3"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("c3") == false
     	session[:gameboard].set_position("c3", "O")
     elsif params["a2"] == "a2"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("a2") == false
     	session[:gameboard].set_position("a2", "O")
     elsif params["b2"] == "b2"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("b2") == false
     	session[:gameboard].set_position("b2", "O")
     elsif params["c2"] == "c2"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("c2") == false
     	session[:gameboard].set_position("c2", "O")
     elsif params["a1"] == "a1"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("a1") == false
     	session[:gameboard].set_position("a1", "O")
     elsif params["b1"] == "b1"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("b1") == false
     	session[:gameboard].set_position("b1", "O")
     elsif params["c1"] == "c1"
		redirect "/Invalid_Move_O" if session[:gameboard].check_position?("c1") == false
     	session[:gameboard].set_position("c1", "O")
	 end
	end
	redirect "/winnerO" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
	redirect "/drawn_game" if session[:gameboard].check_full?() == true

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], value: value, gametype: session[:gametype]}
end

get '/Invalid_Move_X' do
    erb :Invalid_Move_X, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/Invalid_Move_O' do
    erb :Invalid_Move_O, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype]}
end

get '/Basic_Table.erb' do
    erb :Basic_Table,  :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype]}
end
get '/Basic_Table2.erb' do
    erb :Basic_Table2,  :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype]}
end

get "/drawn_game" do
	erb:Drawn_game, :locals => {gameboard: session[:gameboard]}
end

get "/winnerO" do
		erb:win_for_O, :locals => {gameboard: session[:gameboard]}
end

get "/winnerX" do
		erb:win_for_X, :locals => {gameboard: session[:gameboard]}
end
end