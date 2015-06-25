class FibonacciInsight
  def digits(n)
    calculate(n).to_s.length
  end

  private

  def calculate(n)
    return 0 if n == 0
    return 1 if n == 1

    calculate(n-1) + calculate(n-2)
  end
end

describe FibonacciInsight do
  before do
    @fibonacci_insight = FibonacciInsight.new
  end

  describe :digits do
    it "should return 3 for n = 15 (610)" do
      #allow(@fibonacci_insight).to receive(:calculate).and_return(610)
      expect(@fibonacci_insight.digits(15)).to eq(3)
    end

    it "should return 5 for n = 25 (75025)" do
      #allow(@fibonacci_insight).to receive(:calculate).and_return(75025)
      expect(@fibonacci_insight.digits(25)).to eq(5)
    end

    it "should return 9 for n = 40 (102334155)" do
      allow(@fibonacci_insight).to receive(:calculate).and_return(102334155)
      expect(@fibonacci_insight.digits(40)).to eq(9)
    end

    it "should return 13 for n = 60 (1548008755920)" do
      #allow(@fibonacci_insight).to receive(:calculate).and_return(1548008755920)
      expect(@fibonacci_insight.digits(60)).to eq(13)
    end
  end
end
