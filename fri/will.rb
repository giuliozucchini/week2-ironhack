require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
 adapter: 'sqlite3',
 database: 'shouter.sqlite'
)

class User < ActiveRecord::Base
 validates_presence_of :name, :handle# presence, name+handle
 validates :name, presence: true, uniqueness: true # presence+uniqueness, name
 validates :handle, presence: true, uniqueness: true
 validates :password, presence: true, uniqueness: true # add validation for the password. It should be 8 characters long and unique
 has_many :shouts


end

class Shout < ActiveRecord::Base
 validates :likes, numericality: { greater_or_equals_than: 0, only_integer: true }
 # add validations for the message and the user id
 belongs_to :user
end



# @will = User.new
# @will.name = "Will"
# @will.handle = "willywonka"
# @will.password = "americancoffee"
# @will.valid?
# @will.save


# shouts = Shout.new
# p @will.shouts.create(message: "Whoa its Will!", likes: 1)


# -------------- TESTS ------------------#
private

describe User do
 
 before do
     User.all.each { |user| user.destroy }
   @will = User.new
   @will.name = "Will"
   @will.handle = "willywonka"
   @will.password = "americancoffee"

 end

 it "should be valid with correct data" do
   expect(@will.valid?).to be_truthy
 end

 describe :name do
   it "should be invalid with no name" do
     @will.name = nil
     expect(@will.valid?).to be_falsy
   end
 end

 describe :handle do
   it "should be invalid if not unique" do
     @will.save
     @karen = User.new
     @karen.name = "karen"
     @karen.handle = "willywonka"
     @karen.password = "92746392729303827281" 
     expect(@karen.valid?).to be_falsy
   end
 end

 describe :handle do
   it "should be invalid with no handle" do
     @will.handle = nil
     expect(@will.valid?).to be_falsy
   end
 end

 describe :password do
   it "should be invalid when not unique" do
       @will.save
     @karen = User.new
     @karen.name = "karen"
     @karen.handle = "willywonka"
     @karen.password = "americancoffee" 
     expect(@karen.valid?).to be_falsy
   end
 end

 describe :password do
   it "should be invalid when not present" do
     @will.password = nil
     expect(@will.valid?).to be_falsy
   end
 end
end