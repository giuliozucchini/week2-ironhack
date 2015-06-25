# OC2. The Sinatra TODO

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
require 'sinatra/reloader'
require 'rubygems'
require 'active_record'
require 'pry'

set :port, 3009
set :bind, '0.0.0.0'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)


class Ticket < ActiveRecord::Base
end

get '/ticket' do
	erb :ticket
end

post '/list' do
	params
	ticket = Ticket.new(params)
	ticket.save	
	redirect "/list"
end

get '/list' do
	@tickets = Ticket.all
	erb :list
end
