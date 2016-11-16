require 'sinatra'
require 'rubygems'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'board.rb'

enable :sessions

ai = ""


get '/' do
    session[:board] = Board.new
    erb :home
end

# get '/player_1_name' do
#     erb :player_1_name
# end

post '/choose_game' do
	session[:player_1_name] = params[:player_1_name]
	redirect 'choose_opponent'
end

get '/choose_opponent' do
	erb :choose_opponent, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name]}
end

post 'opponent' do
 	opponent = params[:user_opponent]
 		if opponent == "1"
 			redirect '/player_2_name'
 		elsif opponent == "2"
 			redirect '/random_ai'
 		elsif opponent == "3"
 			redirect '/sequential_ai'
 		else opponent == "4" 
 			redirect '/unbeatable_ai'
 				
 		end
 	end

 				
get '/player_2_name' do
    erb :player_2_name
end

# post '/player_2_name' do
#     session[:player_2_name] = params[:player_2_name]
# 	redirect '/play_game'
# end

get '/play_game' do
    erb :play_game, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
    #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
end

get '/rules' do
    erb :rules
end

get '/history' do
    erb :history
end