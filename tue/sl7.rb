# SL7. Valid students are valid students

# You loved the example about students, huh? Let’s student you up then!

# So we are going to do some implementation on this Student class with
# the following:

# 1. Add a “complete_name” method.

# 2. Add some more validations of your own. 
# For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Llorenç" 
# and "Sharon" name, because we want them to be the only ones in Ironhack <3
# the same with “Nick”, because we love him starting at us doing yoga)

# 3. Finally, remove all the ActiveRecord validations and implement them on your 
# own with the “validate” DSL method. Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database
# in Slack.


require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16

validate :pesudo, :proper_age, :complete_name, :doglover

  # validate :pseudo
  # validate :proper_age
  # validate :complete_name
  # validate :doglover

private

def pseudo
  pseudos=["Llorenç", "Sharon", "Nick"]
  pseudos.include?(name)
  errors.add(:name, 'is not possible.')
end

def complete_name
  	unless name && :surname
    errors.add(:complete_name, 'is not correct.')
	end
  end


def proper_age
  	if birthday.nil?
  		errors.add(:birthday, 'is not present')
  		return
  	end
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
  end
end

def doglover
	unless number_of_dogs > 9	
	errors.add(:number_of_dogs, 'are not enough, get a dog')
	end
end

# giulio = Student.new
# giulio.name = "Giulio"
#p giulio.valid?
#p giulio.errors
#p giulio

llorenc = Student.new
llorenc.name = "Llorenç"
p llorenc.name
llorenc.number_of_dogs = 34
p llorenc.valid?
p llorenc.errors
