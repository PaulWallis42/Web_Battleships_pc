require 'sinatra/base'

class BattleshipWeb < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_game' do
    @name = params[:name]
    erb :new_game
  end

  run! if app_file == $0
  set :views, proc { File.join(root, '..', 'views')}
end
