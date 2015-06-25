# SL8. The calculator

# We’ll start with something nice and easy so we learn this testing thing quickly.

# Write a class, called Calculator, that basically performs all four basic math operations:
# addition, substraction, multiplication and
# division. In order to keep it simple, all of them will have two numeric parameters.

# After writing your class, write several tests. For each one, print “OK” if it succeeded, 
# “FAIL” otherwise, in order to test that everything is working out properly.

class Calculator
	attr_accessor :number

	def add(x,y)
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

	def mode(array)
		count = 
	 	array = array.each {|word| count[word] += 1}
	 	count.sort_by { |k,v| v }.last
	end

	def average(array)
		array.inject{ |sum, el| sum + el }.to_f / array.size
	end n

end

calculator = Calculator.new


# Test #1 average positive numbers
print "Testing is:"
if calculator.average([1,2,3,4,5]) == 3
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# ************************** #


# Test #1 median positive numbers
print "Testing is:"
if calculator.mode([1,2,2,2,5]) == 2
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# ************************** #

# Test #1 median positive numbers
print "Testing is:"
if calculator.median([10,20,30,40,50]) == 30
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# ************************** #


# Test #1 ADD positive numbers
print "Testing is:"
if calculator.add(20,10) == 30
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #2 ADD negative numbers
print "Testing is:"
if calculator.add(-10,-10) == -20
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #3 ADD decimals numbers
print "Testing is:"
if calculator.add(0,1.34) == 1.34
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# ****************************** #

# Test #1 SUB positive numbers
print "Testing is:"
if calculator.sub(20,10) == 10
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #2 SUB negative numbers
print "Testing is:"
if calculator.sub(-10,-10) == 0
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #3 SUB decimals numbers
print "Testing is:"
if calculator.sub(0,1.34) == -1.34
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# ****************************** #

# Test #1 MULT positive numbers
print "Testing is:"
if calculator.multi(20,10) == 200
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #2 MULT negative numbers
print "Testing is:"
if calculator.multi(3,-1) == -3
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #3 MULT decimals numbers
print "Testing is:"
if calculator.multi(0,-1.34) == 0
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# ****************************** #

# Test #1 DIV positive numbers
print "Testing is:"
if calculator.div(20,10) == 2
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #2 DIV negative numbers
print "Testing is:"
if calculator.div(50,-2) == -25
  print 'OK'
else
  print 'FAIL'
end
print "\n"

# Test #3 DIV decimals numbers
print "Testing is:"
if calculator.div(50,-10) == -5
  print 'OK'
else
  print 'FAIL'
end


