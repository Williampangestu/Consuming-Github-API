require 'sinatra'
require 'httparty'
require 'json'

get '/' do
  @emojis = Github::Client.new.emojis
  erb :index
end

post '/gists' do
  @gist = Github::Client.new.gist
  @gist["html_url"]
end
