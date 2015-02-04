require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__)+'/lib/*.rb'].each { |file| require file}

get '/' do
  @tamagotchis = Tamagotchi.all
  erb(:index)
end

post '/tamagotchi_add' do
  name = params['name']
  @tamagotchi = Tamagotchi.create({:name => name})
  redirect '/'
end

# get 'tamagotchi/:id' do
#   @tamagotchi = Tamagotchi.find(params['id'])
#   # erb :tamagotchi
# end
