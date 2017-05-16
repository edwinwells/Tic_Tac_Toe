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
	square = [:square]
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
     if params[:square] == params[:square]
		redirect "/Invalid_Move?player=X" if session[:gameboard].check_position?(params[:square]) == false
     	session[:gameboard].set_position(params[:square], "X")
     end     
    end
	redirect "/winner?player=X" if session[:freshgame].check_for_wins(session[:gameboard].setup, "X") == true
	redirect "/drawn_game" if session[:gameboard].check_full?() == true
    erb :Basic_Table2, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], value: value, gametype: session[:gametype]}
end

post '/moveO' do
	square = params[:square]
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
     if params[:square] == params[:square]
		redirect "/Invalid_Move?player=O" if session[:gameboard].check_position?(params[:square]) == false
     	session[:gameboard].set_position(params[:square], "O")
	 end
	end
	redirect "/winner?player=O" if session[:freshgame].check_for_wins(session[:gameboard].setup, "O") == true
	redirect "/drawn_game" if session[:gameboard].check_full?() == true

    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], value: value, gametype: session[:gametype]}
end

get '/Invalid_Move' do
	player = params[:player]

	if params[:player] == "X"
		table = "Basic_Table.erb"
	else table = "Basic_Table2.erb"
	end

    erb :Invalid_Move, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype], player: player, table: table}
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

get "/winner" do
	player = params[:player]

		erb:win, :locals => {gameboard: session[:gameboard], player: player}
end
end