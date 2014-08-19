require 'sinatra'
require 'httparty'
require 'json'

get '/' do
  @emoji_response = HTTParty.get("https://api.github.com/emojis",
                                 headers: {"User-Agent" => "Mule-Deer-App"})
  erb :index
end

post '/gists' do
  options = {
    description: "the description for this gist",
    public: true,
    files: {
      "file1.txt" => {
        content: "String file contents"
      }
    }
  }

  gist_response = HTTParty.post("https://api.github.com/gists",
                                 headers: {"User-Agent" => "Mule-Deer-App",
                                           "Authorization" => "token 31147adbcf010edf2c8d4e8c3f2dfa05d5a172a2"
                                 },
                                 body: options.to_json)
  p gist_response.body
end
