require 'sinatra'
require "sinatra/activerecord"
require "sinatra/reloader"

set :database, {adapter: "sqlite3", database: "db/#{File.basename(__dir__)}.sqlite3"}



get '/' do
  @time = Time.now.strftime("%Y/%m/%d %H:%M")
  @dir = File.basename(__dir__)
  erb :index
end
