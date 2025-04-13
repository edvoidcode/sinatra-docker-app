require 'sinatra'
require 'sinatra/activerecord'
require './models/user'

set :database, { adapter: "sqlite3", database: "db/development.sqlite3" }
set :public_folder, 'public'

get '/' do
  erb :form
end

post '/users' do
  User.create(name: params[:name], gender: params[:gender], email: params[:email])
  redirect '/users'
end

get '/users' do
  @users = User.all
  erb :users
end
