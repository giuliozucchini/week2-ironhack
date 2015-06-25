
require 'pry'
require 'imdb'
require 'rspec'

class Finder

attr_accessor :title

	def which
		list = Imdb::Search.new("llorenc").movies[0].title
		p list
	end

	def which_plot
		list = Imdb::Search.new("mind").movies[0].plot
		p list
	end


	def how_many
		number = Imdb::Search.new("mind").movies.size
		p number
	end

	def guess_movie_by_plot
		@movie = Imdb::Search.new("mind").movies.sample
		@director = @movie.director.to_s
		@plot = @movie.plot.to_s
		@title = @movie.title.to_s
		p "GUESS THE MOVIE!" 
		p "THE DIRECTOR IS: " + @director
		p "THE PLOT IS: " + @plot
		p "What's the name of the movie?"
	end

	def start	
		text = gets.chomp
		binding.pry
    if text == @title
      puts "BRAVO!" 
    else
    	puts "NOPE! Try again."
      start
    end        
  end      
end


finder = Finder.new
# finder.how_many
# finder.which
# finder.which_plot
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