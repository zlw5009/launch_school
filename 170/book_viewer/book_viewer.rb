require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "The Adventures of Sherlock Homles"
  @contents = File.readlines "data/toc.txt" 
  
  erb :home
end

get "/chapter/1" do
  @title = "Chapter 1"
  @contents = File.readlines "data/toc.txt"
  @chapter = File.read "data/chp1.txt"

  erb :chapter
end
