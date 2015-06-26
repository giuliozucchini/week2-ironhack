# SL12. Crazy numbers

# And what else is fun? Numbers! We are going to write a nice Numermaster class that treats with, well... yeah, numbers.

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

# The second method takes a set of numbers. Then, it should return an array with four values:
# 1. The mode
# 2. The median
# 3. The mean
# 4. The size of the array
# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)



class Numbermaster

	def polarize(numbers)
		return nil if numbers.nil? || numbers.empty?
		numbers = clean(numbers)
		polar = return_pos_neg(numbers)
		if polar[:positive] > polar[:negative]
			return numbers.select { |n| n > 0 }
		elsif polar[:positive] < polar[:negative]
			return numbers.select { |n| n < 0 }
		else
		return nil	
		end

	end

	def super_cal(numbers)
		results = []
		results << mode(numbers)
 	end

	private

	def return_pos_neg(numbers)
		polar = { 
			negative: 0,
			:positive => 0
		}
		numbers.each do |n|
			if n > 0
				polar[:positive] += 1
			elsif n < 0
				polar[:negative] += 1
			end
		end
		return polar
	end

	def clean(numbers)
		numbers.select { |n| n.is_a?(Numeric)}
	end

	def mode(numbers)
		count = Hash.new(0)
		results = []
		numbers.each {|n| count[n] += 1}
		count.sort_by { |k,v| v }.reverse
	end

	def median(numbers)
		
	end

	def mean(numbers)
		
	end


end


# **************************** #

describe Numbermaster do
	before do 
		@master = Numbermaster.new
	end


	describe "#polarize" do
		it "when most elements are negative, it should return array with only negative values" do
			expect(@master.polarize([
				-1, -2, 3, -3
				])).to eq [-1,-2,-3]
		end

		it "when most elements are positive, it should return array with only positive values" do
			expect(@master.polarize([
				1, 2, -3, 3
				])).to eq [1,2,3]
		end

		it "if it contains strings, it deletes them" do
			expect(@master.polarize([
				1, 2, -3, "carrot", 3
				])).to eq [1,2,3]
		end


		it "should return nil when the array is empty" do
			expect(@master.polarize([])).to eq nil
		end

		it "should return nil when the array contains an equal amount of neg pos elements" do
			expect(@master.polarize([
				1, -1, 2, -2
				])).to eq nil
		end	

		it "should return nil when the array contains nil" do
			expect(@master.polarize(
				nil
				)).to eq nil
		end	
	end

	describe "#super_cal" do
		it "should return the mode for only the first result " do
			expect(@master.super_cal([2, 4, 6, 6, 1])[0]).to eq(6)
			end
		
		end
end		


# median, mean, size & emptiness








