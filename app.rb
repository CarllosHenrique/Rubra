require 'sinatra'
require "sinatra/activerecord"
require "sinatra/reloader"

set :database, {adapter: "sqlite3", database: "db/#{File.basename(__dir__)}.sqlite3"}


get '/' do
  @code = Time.now
  erb :index
end


