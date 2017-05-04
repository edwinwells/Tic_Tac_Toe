require 'sinatra'
require_relative "unbeatable.rb"
require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"

get '/' do
    erb :initial_page
end

get '/X' do
newboard = GameBoard.new
newboard={
			a1: "a1", a2: "a2", a3: "a3",
		 	b1: "b1", b2: "b2", b3: "b3",
		  	c1: "c1", c2: "c2", c3: "c3"	
		 }

    erb :User_Chooses_X, :locals => {newboard: newboard}
end

get '/O' do
    erb :User_Chooses_O
end



post '/humanX(move)' do
    position = params[:move]
    newboard = params[:newboard]
    # result = startgame(place)
	# newboard.set_position(position, "X")
	# current_setup = params[:setup]
newboard={
			a1: "a1", a2: "a2", a3: "a3",
		 	b1: "b1", b2: "b2", b3: "b3",
		  	c1: "c1", c2: "c2", c3: "c3"	
		 }
    erb :User_Chooses_X, :locals => {newboard: newboard} 

end


# post '/startgame(response)' do
# 	response = params[:response]
# 	erb :showinfo, :locals => {:responsw => response}
# end

# get '/' do
#     response = ""
# 	puts""
 		
# 	until response == "X" || response == "O" do
# 		print " Will you choose to play as X or O? \n Enter X or O: "
# 		response = gets.chomp.upcase
# 		puts ""
#  	end
# end



# post '/unbeatable.rb/startgame()' do
# # 	number = params[:changevalue]
# # 	result = exact_change(number)
# # 	# "OK, for #{number}, you will need #{result}!  Get to countin'!!"
# # 	erb :showinfo, :locals => {:number => number, 
# # 		                       :result => result}
# # 		              end


# # get '/startgame()' do

# 	erb :showinfo, :locals => {:response => response}

# end