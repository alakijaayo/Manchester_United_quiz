require 'sinatra/base'
require './lib/level'

class Quiz < Sinatra::Base
  enable :sessions
  get '/' do
    erb :homepage
  end

  post '/level' do
    session[:level] = Level.new(params[:level])
    redirect '/start'
  end

  get '/start' do
    @level = session[:level]
    erb :choice
  end

  run! if app_file == $0
end
