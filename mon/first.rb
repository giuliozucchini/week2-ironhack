
require 'sinatra'
require 'sinatra/reloader'

set :port, 3001
set :bind, '0.0.0.0'

get '/say-my-name' do
 @name ='Giulio'
 erb :giulio
end