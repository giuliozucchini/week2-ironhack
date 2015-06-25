


require 'sinatra'
enable :sessions

set :port, 3006
set :bind, '0.0.0.0'

users = {}
id = 0

post '/signup' do
id += 1
users[id] = params[:name]
session[:id] = id
redirect('/')
erb :home
end

get '/' do
@users = users
@id = session[:id]
erb :home
end

get '/cats' do
	erb :cats
end