require 'sinatra/base'
require './lib/level'
require './lib/number'

class Quiz < Sinatra::Base
  enable :sessions
  get '/' do
    erb :homepage
  end

  post '/level' do
    session[:level] = Level.new(params[:level])
    session[:number] = Number.new
    redirect '/start'
  end

  get '/start' do
    session[:number]
    @level = session[:level]
    @level.load(session[:number].question)
    erb :choice
  end

  post '/answer' do
    p params
    @level = session[:level]
    @level.load(session[:number].question)
    if params[:answer] == @level.result['correct']
      redirect '/correct'
    else
      redirect '/incorrect'
    end
  end

  get '/correct' do
    @correct = ["Correct!", "Your right!", "Well Done!", "Super!"].sample
    session[:number].add
    erb :correct
  end

  get '/incorrect' do
    @incorrect = ["Wrong!", "Unlucky!", "Try Again!", "Too Bad!"].sample
    session[:number].add
    erb :incorrect
  end

  post '/nextquestion' do
    @level = session[:level]
    @level.load(session[:number].question)
    erb :question
  end

  run! if app_file == $0
end
