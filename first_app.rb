require 'sinatra'
require 'sqlite3'
require 'active_record'
require_relative 'hairy'
require_relative 'bacon'
require_relative 'bobross'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "lipsums.sqlite3"
)

get '/' do
  'Welcome to Earth, third rock from the sun!'
end

get '/:name' do
  if params[:name] == "lorem"
    "The available lipsums are hairy, bacon, and bobross"
  else
    "Hi, #{params['name']}!"
  end
end

get "/lorem/?:lipsum?" do
  if %w(hairy bacon bobross).include? params[:lipsum]
    Object.const_get(params[:lipsum].capitalize).call
  else
    redirect "/not_found"
  end
end
