require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"


get '/' do 
  erb "No data"
end