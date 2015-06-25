
require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'active_record'
require 'pry'

set :port, 3008
set :bind, '0.0.0.0'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16

  validate :doglover, :proper_age, :pseudo

  private

  def pseudo
    pseudos=["Llorenç", "Sharon", "Nick"]
    if pseudos.include?(name)
    errors.add(:name, 'is not possible.')
    end
  end

  def complete_name
    	unless name && surnames
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

get '/add' do
erb :add
end

post '/signup' do
student = Student.new(params)
student.save
@students = Student.all

erb :signup
end

