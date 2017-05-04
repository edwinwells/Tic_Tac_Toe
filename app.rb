require 'sinatra'
# require_relative "unbeatable.rb"
# require_relative "gameboard.rb"
# require_relative "terminal.rb"
# require_relative "player.rb"
# require_relative "game.rb"

get '/' do
    erb :initial_page
end

get '/X' do
    erb :User_Chooses_X
end

get '/O' do
    erb :User_Chooses_O
end



post '/humanX(move)' do
    place = params[:move]
    result = startgame(move)

    if result==true 
        statement1="Congratulations!"
        statement2="Your ISBN #{number} is Valid!"
        statement3="Have a nice day:-)"
    else
        statement1="Sorry 'bout your luck!"
        statement2="You got hold of a counterfeit ISBN!"
        statement3="Better luck next time..."
    end
    erb :showisbnresult, :locals => {:number => number,:statement1 => statement1, :statement2 => statement2, :statement3 => statement3} 

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