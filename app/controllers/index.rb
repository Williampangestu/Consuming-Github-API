require 'sinatra'
require 'httparty'
require 'json'

get '/' do

  @emoji_response = HTTParty.get("https://api.github.com/emojis",
                                 headers: {"User-Agent" => "Mule-Deer-App"})

  @emoji_response = JSON.parse(@emoji_response.body)
  erb :index
end
