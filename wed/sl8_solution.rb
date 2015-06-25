# SL8. The calculator

class Calculator
  def addition(x,y)
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

# Prepare numerifier
puts "===LET'S TEST SOME STUFF==="
calculator = Calculator.new

# Test #1
print "Should add correctly: "
if calculator.addition(1,3) == 4
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #2
print "Should add when having x nil: "
if calculator.addition(1,nil) == 1
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #3
print "Should add when having y nil: "
if calculator.addition(nil,2) == 2
  print 'OK'
else
  print 'FAIL'
end
print "\n"
