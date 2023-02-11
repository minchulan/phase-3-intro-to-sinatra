require 'sinatra'
#setting up a block of code that will run whenever a GET request comes in to the /hello path of our application. Whatever is returned by the block will be sent back as the response: in this case, it's a string representing some HTML.
class App < Sinatra::Base
  # Add this line to set the Content-Type header for all responses 
  set :default_content_type, 'application/json'

  get '/' do
    "<h1>What's up!</h1>"
  end 
  get '/hello' do
    "<h2>Hello <em>World</em>!</h2>"
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end 

  get '/dice/2' do
    dice_roll = rand(1..6)
    "<h2>You rolled a #{dice_roll}</h2>"
  end 

  get '/dice' do
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json 
  end 

  get '/add/1/2' do 
    sum = 1 + 2 
    { result: sum }.to_json 
  end 

  # :num1 and :num2 are named parameters
  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i 

    sum = num1 + num2 
    { result: sum }.to_json 
  end 

  get '/games/:id' do 
    game = Game.find(params[:id])
    game.to_json 
  end 
  
end

run App.new

# class App
#   def call(env)
#     [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
#   end
# end

# run App.new