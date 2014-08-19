module Github
  class Client
    include HTTParty
    base_uri "https://api.github.com"

    def emojis
      self.class.get("/emojis",
                   headers: {"User-Agent" => "Mule-Deer-App"})
    end

    def gist
      options = {
        description: "the description for this gist",
        public: true,
        files: {
          "file1.txt" => {
            content: "String file contents"
          }
        }
      }

      gist_response = self.class.post("/gists",
                                     headers: {"User-Agent" => "Mule-Deer-App",
                                               "Authorization" => "token 88e4b4bd8abf23dd7ad07ca28427a3d677230ce6"
                                     },
                                     body: options.to_json)

    end
  end
end
