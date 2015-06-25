class Numerifier
  attr_accessor :numbers

  def count
    numbers.size
  end

  def max_under_10
    return :ironhack if count == 5

    numbers.select do |number|
      number < 10
    end.max
  end
end

describe Numerifier do
  before do
    @numerifier = Numerifier.new
  end

  describe "#count" do
    it "should return 0 with an empty array" do
      @numerifier.numbers = []
      expect(@numerifier.count).to eq(0)
    end

    it "should return 4 with a 4-element array" do
      @numerifier.numbers = [1,2,3,4]
      expect(@numerifier.count).to eq(4)
    end
  end

  describe "#max_under_10" do
    it "should work with only-over-10 numbers" do
      @numerifier.numbers = [10,15,16,19]
      expect(@numerifier.max_under_10).to eq(nil)
    end

    it "should work with only-under-10 numbers" do
      @numerifier.numbers = [1,2,3,4]
      expect(@numerifier.max_under_10).to eq(4)
    end

    it "should work with any kind of number" do
      @numerifier.numbers = [1,5,9,10,11,12]
      expect(@numerifier.max_under_10).to eq(9)
    end

    it "should return :ironhack if we have five numbers" do
      @numerifier.numbers = [1,2,3,4,5]
      expect(@numerifier.max_under_10).to eq(:ironhack)
    end
  end
end
