require 'sinatra/base'

class Quiz < Sinatra::Base
  enable :sessions
  get '/' do
    erb :homepage
  end

  post '/level' do
    session[:level] = params[:level]
    redirect '/start'
  end

  get '/start' do
    @level = session[:level]
    erb :choice
  end
end
