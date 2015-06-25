require 'sinatra'

get '/' do
  erb :date
end

post '/hello' do
  @name = params["username"]
  "Hello #{@name}"
end

get '/hello/:username' do
  @name = params["username"]
  "Hello #{@name}"
end