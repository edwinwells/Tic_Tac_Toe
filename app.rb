require 'sinatra'
require_relative 'unbeatable.rb'
require_relative "gameboard.rb"
require_relative "terminal.rb"
require_relative "player.rb"
require_relative "game.rb"

get '/' do
    erb :ttt
end

get '/startgame()' do
end