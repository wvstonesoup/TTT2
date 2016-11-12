require 'sinatra'
require_relative 'random_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'board.rb'
# require_relative 'game_console.rb'

enable :sessions

ai = ""

play_board = Board.new()
# players = Gameplayers.new()

get '/' do
    erb :home
end