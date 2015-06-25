# SL8b. The calculator, reloaded
# Just take the calculator you implemented, but use RSpec!

require 'RSpec'

class Calculator
	attr_accessor :numbers, :array

	def add(x,y)
    if x.nil?
      return y
    end
    if y.nil?
      return x
    end  
		x + y 
	end

	def sub(x,y)
		x - y
	end

	def multi(x,y)
		x * y
	end

	def div(x,y)
	x / y
	end

	def median(array)
		sorted = array.sort
  		len = sorted.length
  		return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
	end

  def average(array)
    array.inject{ |sum, el| sum + el }.to_f / array.size
  end

end


describe Calculator do 
  before do
    @calculator = Calculator.new
  end

  describe "#add_numbers" do 
    it "should work with integers" do
      add_result = @calculator.add(2,3)
      expect(add_result).to equal(5)
    end

    it "should work with float numbers" do
      add_result = @calculator.add(2.5,3.5)
      expect(add_result).to equal(6.0)
    end
  end

  describe "#substract_numbers" do 
    it "should work with integers" do
      sub_result = @calculator.sub(4,2)
      expect(sub_result).to equal(2)
    end

    it "should work with float numbers" do
      add_result = @calculator.sub(4.5,1.5)
      expect(add_result).to equal(3.0)
    end
  end

  describe "#multiply_numbers" do 
    it "should work with integers" do
      multi_result = @calculator.multi(4,2)
      expect(multi_result).to equal(8)
    end

    it "should work with float numbers" do
      multi_result = @calculator.multi(2.5,2.5)
      expect(multi_result).to equal(6.25)
    end
  end

  describe "#divide_numbers" do 
    it "should work with integers" do
      multi_result = @calculator.div(4,2)
      expect(multi_result).to equal(2)
    end

    it "should work with float numbers" do
      div_result = @calculator.div(2.5,2.5)
      expect(div_result).to equal(1.0)
    end
  end

  describe "#average_numbers" do 
    it "should work with integers" do
      ave_result = @calculator.average([2,4,6,8,10]) 
      expect(ave_result).to equal(6.0)
    end
  end

  describe "#average_numbers" do 
    it "should work with integers" do
      ave_result = @calculator.average([2.0,4.0,6.0,8.0,10.0]) 
      expect(ave_result).to equal(6.0)
    end
  end

  describe "#add_numbers" do 
    it "should work with nil" do
      expect(@calculator.add(2,nil)).to equal(2)
    end
  end

  describe "#add_numbers" do 
    it "should work with nil" do
      expect(@calculator.add(nil,nil)).to be_nil
    end
  end

  describe "#average_numbers" do 
    it "should work with integers" do
      # expect @calculator.average([2,4,6,8,10]) == (6)
    end
  end

end


# # Test #1 average positive numbers
# print "Testing is:"
# if calculator.average([1,2,3,4,5]) == 3
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # ************************** #

# # Test #1 median positive numbers
# print "Testing is:"
# if calculator.median([10,20,30,40,50]) == 30
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"


# # Test #1 ADD positive numbers
# print "Testing is:"
# if calculator.add(20,10) == 30
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #2 ADD negative numbers
# print "Testing is:"
# if calculator.add(-10,-10) == -20
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #3 ADD decimals numbers
# print "Testing is:"
# if calculator.add(0,1.34) == 1.34
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # ****************************** #

# # Test #1 SUB positive numbers
# print "Testing is:"
# if calculator.sub(20,10) == 10
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #2 SUB negative numbers
# print "Testing is:"
# if calculator.sub(-10,-10) == 0
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #3 SUB decimals numbers
# print "Testing is:"
# if calculator.sub(0,1.34) == -1.34
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # ****************************** #

# # Test #1 MULT positive numbers
# print "Testing is:"
# if calculator.multi(20,10) == 200
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #2 MULT negative numbers
# print "Testing is:"
# if calculator.multi(3,-1) == -3
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #3 MULT decimals numbers
# print "Testing is:"
# if calculator.multi(0,-1.34) == 0
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # ****************************** #

# # Test #1 DIV positive numbers
# print "Testing is:"
# if calculator.div(20,10) == 2
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #2 DIV negative numbers
# print "Testing is:"
# if calculator.div(50,-2) == -25
#   print 'OK'
# else
#   print 'FAIL'
# end
# print "\n"

# # Test #3 DIV decimals numbers
# print "Testing is:"
# if calculator.div(50,-10) == -5
#   print 'OK'
# else
#   print 'FAIL'
# end


