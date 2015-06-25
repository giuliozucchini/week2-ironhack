# SL8b. The calculator, reloaded

class Calculator
  def addition(x,y)
    return if x.is_a?(Symbol) || y.is_a?(Symbol)
    return x if y.nil?
    return y if x.nil?
    x + y
  end

  def substraction(x,y)
    x - y
  end

  def multiplication(x,y)
    x * y
  end

  def division(x,y)
    x / y
  end
end

describe Calculator do
  before do
    @calculator = Calculator.new
  end

  describe "#addition" do
    it "should add 5 and 6" do
      addition = @calculator.addition(5,6)
      expect(addition).to eq(11)
    end

    it "should add 0 and 4" do
      addition = @calculator.addition(0,4)
      expect(addition).to eq(4)
    end

    it "should add 7 and nil" do
      addition = @calculator.addition(7,nil)
      expect(addition).to eq(7)
    end

    it "should be nil if there is a symbol" do
      addition = @calculator.addition(:horse,nil)
      expect(addition).to eq(nil)
    end
  end
end
