# OC1. The Sinatra TODO

# In the good old days, programming a basic blog was the "Hello World!" for the web. Now it seems to be writing a TODO list,
# as if we wanted to overthrone Evernote for that. So let's be hipsters about it, and do the job!

# Let's use Sinatra for that! Write a small application that allows us to:

# - Add tasks to a list
# - Clicking over a task should mark it as done
# - Once done we should be able to delete a task
# - The date of creation should be shown together with the task
# - If the task contains the word urgent the task will become the most prioritary
# - The task list should be saved in a file so we can restart the application and the tasks should persist.

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