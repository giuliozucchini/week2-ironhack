class Numerifier
  attr_accessor :numbers

  def positive_numbers
    return if numbers.nil?
    numbers.select { |number| number.is_a?(Numeric) && number > 0 }
  end
end

# Prepare numerifier
puts "===LET'S TEST SOME STUFF==="
numerifier = Numerifier.new

# Test #1
print "Testing with an empty array: "
numerifier.numbers = []
if numerifier.positive_numbers == []
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #2
print "Testing with some numbers: "
numerifier.numbers = [1,2,4,-5,0,15,-40]
if numerifier.positive_numbers == [1,2,4,15]
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #3
print "Testing with some numbers: "
numerifier.numbers = [1,:cat,[],-5,6.78]
if numerifier.positive_numbers == [1,6.78]
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #4
print "Testing with nil: "
numerifier.numbers = nil
if numerifier.positive_numbers == nil
  print 'OK'
else
  print 'FAIL'
end
print "\n"
