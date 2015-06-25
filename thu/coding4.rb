class Mather
  def method1(arg1=nil)
    return 0 if arg1.nil?
    return arg1.size if arg1.is_a?(Array)
    return arg1.to_i if arg1.is_a?(Float)

    arg1.reverse
  end
end

describe Mather do
  before { @mather = Mather.new }

  describe :method1 do
    it "should return 0 when we pass nothing" do
      expect(@mather.method1).to eq(0)
    end

    it "should return a string reversed if we pass a string" do
      expect(@mather.method1('Ironhack')).to eq('kcahnorI')
    end

    it "should return the number of elements if we pass an array" do
      expect(@mather.method1([])).to eq(0)
    end

    it "should return the number of elements if we pass an array #2" do
      expect(@mather.method1([1,4,5,6])).to eq(4)
    end

    it "should return the integer part of a float number" do
      expect(@mather.method1(1.7)).to eq(1)
    end
  end
end
