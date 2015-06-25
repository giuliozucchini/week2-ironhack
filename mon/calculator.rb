

require 'sinatra'
require 'sinatra/reloader'

set :port, 3003
set :bind, '0.0.0.0'


result = []

get '/' do
  	 erb :calculator
end

get '/count' do
	@count= (1..200).to_a
	p @count
	erb :count
end

post '/add' do
    p params
    @operator = "adding"
    @first_num = params["sum1"].to_i
    @second_num = params["sum2"].to_i
    @result = @first_num + @second_num

    erb :results
end

post '/sub' do
    p params
    @operator = "substracting"
    @first_num = params["sub1"].to_i
    @second_num = params["sub2"].to_i
    @result = @first_num - @second_num

    erb :results
end

post '/mult' do
    p params
    @operator = "multipling"
    @first_num = params["mult1"].to_i
    @second_num = params["mult2"].to_i
    @result = @first_num * @second_num

    erb :results
end

post '/divis' do
    p params
    @operator = "dividing"
    @first_num = params["divis1"].to_i
    @second_num = params["divis2"].to_i
    @result = @first_num / @second_num

    erb :results
end


