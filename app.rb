require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

get "/" do
  @database = DB
  @comments = COMMENTS
  erb :index
end
