require 'rubygems'
require 'active_record'
require 'pry'

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

def random_password(length=8)
  chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
  password = ''
  length.times { password << chars[rand(chars.size)] }
  password
end

end

 class Shout < ActiveRecord::Base
  validates :likes, numericality: { greater_or_equals_than: 0, only_integer: true }
  validates :message, numericality: { greater_than_or_equal_to: 0length(<=200)}
  validates :user_id  # add validations for the message and the user id
  belongs_to :user
end


llorenc = User.find_by(name: "Sharon")
@llorenc = User.new
@llorenc.name = "Llorenc"
@llorenc.handle = "llorencissimo"
@llorenc.password = @llorenc.random_password
@llorenc.save
p @llorenc

# -------------- TESTS ------------------#
# private

# describe User do
#   before do
#     sharon = User.find_by(name: "Sharon")
#     sharon.destroy if sharon
#     @sharon = User.new
#     @sharon.name = "Sharon"
#     @sharon.handle = "sharebear"
#     @sharon.password = @sharon.random_password
#   end

#   it "should be valid with correct data" do
#     expect(@sharon.valid?).to be_truthy
#   end

#   describe :name do
#     it "should be invalid with no name" do
#       @sharon.name = nil
#       expect(@sharon.valid?).to be_falsy
#     end
#   end

#   describe :handle do
#     it "should be invalid if not unique" do
#       @sharon.save
#       @karen = User.new
#       @karen.name = "karen"
#       @karen.handle = "sharebear"
#       @karen.password = "92746392729303827281" 
#       expect(@karen.valid?).to be_falsy
#     end
#   end

#   describe :handle do
#     it "should be invalid with no handle" do
#       @sharon.handle = nil
#       expect(@sharon.valid?).to be_falsy
#     end
#   end

#   describe :password do
#     it "should be invalid when not unique" do
#       @sharon.save
#       @karen = User.new
#       @karen.name = "karen"
#       @karen.handle = "sharebear"
#       @karen.password = "doodles" 
#       expect(@karen.valid?).to be_falsy
#     end
#   end

#   describe :password do
#     it "should be invalid when not present" do
#       @sharon.password = nil
#       expect(@sharon.valid?).to be_falsy
#     end
#   end

# end
