# OC1. IronhackLIST

# Oh, man. We are so proud of our Student class. Validated, short, compact. Is it love?

# Anyway, the thing you probably missed from SL7 is having some web in between. 
# Some routes, some Sinatra, some ERB… so let’s do it, why
# not?

# You will now implement a Ironhack directory of students, that shows a list of 
# everyone’s name, surname, birthday, a clickable link to
# their website, if they have programming experience or not (Yes/No) and, more importantly, 
# ¡the number of dogs they have!

# Apart from that, you should be able to create new students through the interface, 
# and also delete the ones which have 0 dogs (we cannot
# kick the others out, they have dogs!).

# Go for it!

require 'sinatra'
enable :sessions

set :port, 3004
set :bind, '0.0.0.0'

users = {}
id = 0

post '/signup' do
id += 1
users[id] = params[:post]
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