
require 'pry'
require 'imdb'
require 'rspec'
require 'launchy'
# require 'sinatra'
# require 'sinatra/reloader'

class Finder

attr_accessor :title, :poster, :trailer, :universe

	# def which
	# 	list = Imdb::Search.new("llorenc").movies[0].title
	# 	p list
	# end

	# def which_plot
	# 	list = Imdb::Search.new("mind").movies[0].plot
	# 	p list
	# end

	# def choose_universe
			
	# end	

	# def how_many
	# 	number = Imdb::Search.new("mind").movies.size
	# 	p number
	# end

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

	def start	
		text = gets.chomp
    if text == @title
      puts "BRAVO!"
    elsif text == "hint"
      Launchy.open @poster
      start
    elsif text == "solution"
			puts "The solution is:"
			puts @title
    else
    	puts "NOPE! Try again."
      start
    end        
  end     
end


finder = Finder.new
finder.guess_movie_by_plot
finder.start

# describe Finder do 
#   before do
#     @finder = Finder.new
# 	end


#   describe "how_many" do 
#     it "should say how many" do
#       result = @finder.how_many 
#       expect(result).to be > 10
#     end
#   end
# end