require 'sinatra'
require 'sinatra/reloader'

set :port, 3000
enable :sessions

last_id ||= 0
users ||= {}

get '/' do
  @users = users
  if session[:id]
    @current_user = users[session[:id]]
  end

  erb :bigbrother
end

post '/signup' do
  name = params[:name]
  last_id += 1
  users[last_id] = name
  session[:id] = last_id
  redirect '/'
end

get '/cats' do
  erb :cats
end
