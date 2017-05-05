require 'sinatra'
require_relative "unbeatable.rb"
require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"

# enable :sessions

get '/' do
    erb :initial_page
end

get '/X' do

		playerX = Player.new("X")
		playerO = ComputerUnbeatable.new("O")
		reset = "N"

		freshgame = VersusUnbeatable.new(playerX, playerO, reset)

	freshgame = {
				a1: "X", a2: "", a3: "",
			 	b1: "", b2: "", b3: "",
			  	c1: "", c2: "", c3: ""	
			       }

legend = GameBoard.new
legend={
			a1: "a1", a2: "a2", a3: "a3",
		 	b1: "b1", b2: "b2", b3: "b3",
		  	c1: "c1", c2: "c2", c3: "c3"	
		 }

    erb :User_Chooses_X, :locals => {freshgame: freshgame, legend: legend}
end

get '/O' do
    erb :User_Chooses_O
end



post '/humanX(move)' do
	# current_game.set_position


	# @setup[:"#{position}"] = character

	freshgame = params[:freshgame]
    legend = params[:legend]
    position = params[:move]
    playerX = params[:playerX]
    playerO = params[:playerO]

	freshgame = VersusUnbeatable.new(playerX, playerO, "No")

	# freshgame = {
	# 			a1: "X", a2: "", a3: "",
	# 		 	b1: "", b2: "", b3: "",
	# 		  	c1: "", c2: "", c3: ""	
	# 	        }    

	freshgame.run_game(playerX, playerO, "X")

# 
    # puts current_game

    # result = startgame(place)
	# newboard.set_position(position, "X")
	if position != "a1" ||
		position != "a2" ||
		position != "a3" ||
		position != "b1" ||
		position != "b2" ||
		position != "b3" ||
		position != "c1" ||
		position != "c2" ||
		position != "c3"
		puts "Invalid entry! Please try again."
	end

# freshgame = {
# 			a1: "X", a2: "", a3: "",
# 		 	b1: "", b2: "", b3: "",
# 		  	c1: "", c2: "", c3: ""	
# 		       }
legend = {
			a1: "a1", a2: "a2", a3: "a3",
		 	b1: "b1", b2: "b2", b3: "b3",
		  	c1: "c1", c2: "c2", c3: "c3"	
		 }

    erb :User_Chooses_X, :locals => {freshgame: freshgame, legend: legend} 

end