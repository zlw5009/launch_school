require 'sinatra'
require 'sinatra/reloader' if development?
require 'tilt/erubis'
require 'yaml'

before do 
  @users = YAML.load_file 'users.yaml'
end

helpers do
  def count_interests(users)
    users.reduce(0) do |sum, (name, user_info)|
      require 'pry' ; binding.pry
      sum + user_info[:interests].size
    end
  end
end

get '/' do
  redirect '/users'
end

get '/users' do
  erb :users
end

get '/:user_name' do
  @user_name = params[:user_name].to_sym
  @email = @users[@user_name][:email]
  @interests = @users[@user_name][:interests]

  erb :user
end
