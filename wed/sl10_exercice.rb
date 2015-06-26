
require 'pry'
require 'imdb'
require 'rspec'
require 'launchy'
require 'sinatra'
require 'sinatra/reloader'

set :port, 3001
set :bind, '0.0.0.0'

movie ||= ""

#get is load page / will dixit
get '/start' do
	erb :start
end

post '/start' do
	universe = params[:universe]
	movie = Imdb::Search.new(universe).movies.sample
	redirect ('/game')
end

get '/game' do
	  @movie = movie
		@director = @movie.director.to_s
		@plot = @movie.plot.to_s
		@title = @movie.title
		@poster = @movie.poster
		@trailer = @movie.trailer_url

	erb :game
end

post '/game' do
	answer = params[:answer]
  @string = ""
   if params[:answer] == @title
       @string = "Bravo!"
    elsif params[:answer] == "hint"
      open @poster
    elsif params[:answer] == "solution"
			@string = "The solution is:{#@title}"
    else
    	@string = "NOPE...! ! Try again ! ! "
    end        
	erb :game
end




