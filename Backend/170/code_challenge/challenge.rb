require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do 
  # sets the files instance variable = to an object of the Dir class
  # the Dir class method glob is passing in an array of files from "public/*" directory
  # and including all files in the directory
  # .map will map over the array of files 
  # File.basename returns the last component of the file name given by file
  # After all files in the array are returned, the Array#sort method is called to 
  # sort the file names alphabetically
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort 

  # If the url returns param, reverse the list in desc order
  @files.reverse! if params[:sort] == "desc" 

  erb :list # This is refering to the view/list.erb file 
end