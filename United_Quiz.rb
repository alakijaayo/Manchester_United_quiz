require 'sinatra/base'

class Quiz < Sinatra::Base
  get '/' do
    erb :homepage
  end
end
