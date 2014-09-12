require 'sinatra'
require 'httparty'
require 'json'

get '/' do
  @emoji_response = HTTParty.get("https://api.github.com/emojis",
                    headers: {"User-Agent" => "WilliamPangestu"
                      })
  # p @emoji_response
  # p @emoji_response.body
  @emojis = JSON.parse(@emoji_response.body)
  # p @emojis
  erb :index
end

