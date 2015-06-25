# SL9. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the tast. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!



class MasterOfTheUniverse

attr_accessor :s

	def initialize
		@s = []
	end

	def add_movie(title, rank, date)
		@s << [title, rank, date]
	end

end
	

gof = MasterOfTheUniverse.new
gof.add_movie("Games of thrones", 2, 1931)

  








# serie = MasterOfTheUniverse.new
# p serie.rank

describe MasterOfTheUniverse do 
  before do
    @serie = MasterOfTheUniverse.new
end


  describe "#ranking" do 
    it "should rank 0 to 6" do
      result = @serie.rank 
      expect(result.to_a[0][0]).to eq('Games of thrones')
    end
  end

  describe "#ranking" do 
    it "should rank 0 to 6" do
      result = @serie.rank 
      expect(result.first.first).to eq('Games of thrones')
    end
  end

  describe "#timeline" do 
    it "should rank series in time" do
      result = @serie.time
      expect(result.first.first).to eq('Magic')
    end
  end
end
