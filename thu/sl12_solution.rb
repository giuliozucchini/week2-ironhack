# SL12. Crazy numbers

class NumbersMaster
  def majority(numbers)
    positive_numbers = numbers.select { |number| number > 0 }
    negative_numbers = numbers.select { |number| number < 0 }

    if positive_numbers.size > negative_numbers.size
      positive_numbers
    elsif negative_numbers.size > positive_numbers.size
      negative_numbers
    end
  end

  def information(numbers)
    size = numbers.size

    mode_hash = {}
    numbers.each do |number|
      mode_hash[number] ||= 0
      mode_hash[number] += 1
    end
    max_freq = mode_hash.values.max
    mode = numbers.select { |number| mode_hash[number] == max_freq }.uniq

    sorted_numbers = numbers.sort
    median = if numbers.size.even?
      pos1 = size / 2
      pos2 = size / 2 - 1
      (sorted_numbers[pos1] + sorted_numbers[pos2]) / 2
    else
      sorted_numbers[size / 2]
    end

    mean = numbers.inject(:+) / size

    [mode, median, mean, size]
  end

    def slow_fibonacci(n)
      return 0 if n == 0
      return 1 if n == 1

      slow_fibonacci(n-1) + slow_fibonacci(n-2)
    end

  def fibonacci(n)
    return 0 if n == 0
    return 1 if n == 1

    fibonacci_cache ||= {}
    fibonacci_cache[n] ||= (fibonacci(n-1) + fibonacci(n-2))
  end
end

describe NumbersMaster do
  before do
    @numbers_master = NumbersMaster.new
  end

  describe "#majority" do
    it "should return the positive ones if they are majority" do
      expect(@numbers_master.majority([1,4,5,6,-2,-3,-1])).to eq([1,4,5,6])
    end

    it "should return the negative ones if they are majority" do
      expect(@numbers_master.majority([1,4,5,-6,-2,-3,-1])).to eq([-6,-2,-3,-1])
    end

    it "should return nil if there is a draw" do
      expect(@numbers_master.majority([1,4,5,-2,-3,-1])).to eq(nil)
    end
  end

  describe "#information" do
    it "should return the correct information" do
      expect(@numbers_master.information([1,4,5,4,3])).to eq([[4],4,3,5])
    end
  end

  describe "#fibonacci" do
    it "should return 0 for 1" do
      expect(@numbers_master.fibonacci(0)).to eq(0)
    end

    it "should return 1 for 2" do
      expect(@numbers_master.fibonacci(1)).to eq(1)
    end

    it "should return 280571172992510140037611932413038677189525 for 200" do
      expect(@numbers_master.fibonacci(200)).to eq(280571172992510140037611932413038677189525)
    end
  end
end
