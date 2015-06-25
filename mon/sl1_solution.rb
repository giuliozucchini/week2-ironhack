require 'sinatra'

songs ||= []

get '/' do
  # Redirect to home
  if songs.size >= 3
    redirect to('/enough')
  end

  "Nr songs: #{songs.count}"
end

post '/songs/new' do
  # Gets info
  author = params[:artist]
  name = params[:name]

  # Stores info
  songs << [name, author]
end

get '/enough' do
  "LEAVE ME ALONE WITH THESE CRAPPY SONGS"
end

__END__

Testing it!

curl --data "name=LedZeppelin&artist=StairwayToHeaven" localhost:4567/songs/new
curl --data "name=Sara&artist=FleetwoodMac" localhost:4567/songs/new
curl --data "name=Help&artist=Beatles" localhost:4567/songs/new
curl --data "name=Falco&artist=RockMeAmadeus" localhost:4567/songs/new
curl --data "name=BeeGees&artist=Tragedy" localhost:4567/songs/new
