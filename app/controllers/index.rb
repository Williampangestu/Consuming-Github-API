require 'sinatra'
require 'httparty'
require 'json'

get '/' do
  @emoji_response = HTTParty.get("https://api.github.com/emojis")
  p @emoji_response
  # erb :index
end
