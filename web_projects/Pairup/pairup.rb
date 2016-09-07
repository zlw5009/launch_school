#pairup.rb

require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'

get '/' do
  redirect '/home'
end

get '/home' do
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end