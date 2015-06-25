class Numerifier
  attr_accessor :numbers

  def positive_numbers
    return if numbers.nil?
    numbers.select { |number| number.is_a?(Numeric) && number > 0 }
  end
end

describe Numerifier do
  before do
    @numerifier = Numerifier.new
  end

  describe "#positive_numbers" do
    context "when we are passing only numbers" do
      it "should work with an empty array" do
        @numerifier.numbers = []
        expect(@numerifier.positive_numbers).to eq([])
      end

      it "should work with some numbers" do
        @numerifier.numbers = [1, 4, -5, 0, 3]
        expect(@numerifier.positive_numbers).to eq([1,4,3])
      end
    end

    context "when we are passing any weird kinds of stuff" do
      it "should work with numbers and other stuff" do
        @numerifier.numbers = [1,:cat,[],-5,6.78]
        expect(@numerifier.positive_numbers).to eq([1,6.78])
      end

      it "should work with nil" do
        @numerifier.numbers = nil
        expect(@numerifier.positive_numbers).to eq(nil)
      end
    end
  end
end
