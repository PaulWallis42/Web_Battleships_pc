require 'sinatra/base'
require 'battleships'

class BattleshipWeb < Sinatra::Base
  attr_reader :game
  attr_reader :coordinate
  attr_reader :orientation
  attr_reader :ship

  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    @ship = params[:ship]
    @coordinate = params[:coordinate]
    @orientation = params[:orientation]
    erb :new_game
  end

  get '/start_game' do
    @game = Game.new Player, Board
    game.player_1.place_ship Ship.battleship, :B4, :vertically
    erb :start_game
  end

  get '/own_board' do
    @p1_board = game.own_board_view game.player_1
    erb :own_board
  end

  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views')}
end
