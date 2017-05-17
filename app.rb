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
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end

get '/leveloneHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerSequential.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusSequential.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 2
	gametype = params[:gametype]
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end

get '/leveloneHumanO' do
	session[:playerX] = ComputerSequential.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusSequential.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 3
	gametype = params[:gametype]
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end

get '/leveltwoHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerRandom.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusRandom.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 4
	gametype = params[:gametype]
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end

get '/leveltwoHumanO' do
	session[:playerX] = ComputerRandom.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusRandom.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 5
	gametype = params[:gametype]
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end

get '/levelthreeHumanX' do
	session[:playerX] = Player.new("X")
	session[:playerO] = ComputerUnbeatable.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 6
	gametype = params[:gametype]
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end

get '/levelthreeHumanO' do
	session[:playerX] = ComputerUnbeatable.new("X")
	session[:playerO] = Player.new("O")
	session[:reset] = "N"
	session[:freshgame] = VersusUnbeatable.new(session[:playerX], session[:playerO], session[:reset])
	session[:gameboard] = GameBoard.new
	session[:gametype] = 7
	gametype = params[:gametype]
	session[:current_player] = "X"
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset],gameboard: session[:gameboard], gametype: session[:gametype], current_player: session[:current_player]}
end
 
post '/move' do
	square = [:square]
	freshgame = params[:freshgame]
    playerX = params[:playerX]
    playerO = params[:playerO]
    gameboard = params[:gameboard]
	reset = params[:reset]
	value = params[:value]
	gametype = params[:gametype]
	current_player = session[:current_player]

	if session[:current_player] == "X"
		if session[:gametype] == 3 ||
		   session[:gametype] == 5 ||
		   session[:gametype] == 7 
				session[:playerX].get_move(session[:gameboard],session[:current_player])
	   	else
			redirect "/invalid_move?player=#{current_player}&action=/move#{current_player}" if session[:gameboard].check_position?(params[:square]) == false
	     	session[:gameboard].set_position(params[:square], session[:current_player])
	    end
	else
		if session[:gametype] == 2 ||
		   session[:gametype] == 4 ||
		   session[:gametype] == 6 
				session[:playerO].get_move(session[:gameboard],session[:current_player])
	   	else
			redirect "/invalid_move?player=#{current_player}&action=/move#{current_player}" if session[:gameboard].check_position?(params[:square]) == false
	     	session[:gameboard].set_position(params[:square], session[:current_player])
	    end		
	end
	redirect "/winner?player=#{current_player}" if session[:freshgame].check_for_wins(session[:gameboard].setup, current_player) == true
	redirect "/drawn_game" if session[:gameboard].check_full?() == true
	if session[:current_player] == "X"
		session[:current_player] = "O"
	else
		session[:current_player] = "X"
	end		
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], value: value, gametype: session[:gametype], current_player: current_player}
end

get '/invalid_move' do
	player = params[:player]
	action = params[:action]
    erb :Invalid_Move, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype], player: player, action: action}
end

get '/Basic_Table.erb' do
    erb :Basic_Table, :locals => {playerX: session[:playerX], playerO: session[:playerO],freshgame: session[:freshgame], reset: session[:reset], gameboard: session[:gameboard], gametype: session[:gametype], action: session[:action]}
end

get "/drawn_game" do
	erb :drawn_game, :locals => {gameboard: session[:gameboard]}
end

get "/winner" do
	player = params[:player]
		erb :win, :locals => {gameboard: session[:gameboard], player: player}
end
end