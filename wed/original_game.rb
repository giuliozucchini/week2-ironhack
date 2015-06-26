


require 'pry'
require 'imdb'
require 'rspec'
require 'launchy'
require 'sinatra'
require 'sinatra/reloader'


# ///////// ORIGINAL FILE \\\\\\\\\\\\


class Finder
attr_accessor :title, :poster, :trailer, :universe

	def choose_universe
		puts "Type a word launch the game | ex. love ? war ? watermelon? |"
		@universe = gets.chomp
		@movie = Imdb::Search.new("@universe").movies.sample
	end

	def guess_movie_by_plot
		choose_universe
		@director = @movie.director.to_s
		@plot = @movie.plot.to_s
		@title = @movie.title.delete "(",")"
		@poster = @movie.poster
		@trailer = @movie.trailer_url
		p "GUESS THE MOVIE!" 
		p "THE DIRECTOR IS: " + @director
		p "THE PLOT IS: " + @plot
		p "What's the name of the movie? Click 'hint' for help!"
	end

	def answer	
		text = gets.chomp
    if text == @title
      puts "BRAVO!"
    elsif text == "hint"
      Launchy.open @poster
      answer
    elsif text == "solution"
			puts "The solution is:"
			puts @title
    else
    	puts "NOPE! Try again."
      answer
    end        
  end     
end

finder = Finder.new
finder.guess_movie_by_plot
finder.answer
