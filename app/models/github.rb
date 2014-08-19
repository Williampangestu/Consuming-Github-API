module Github
  class Client
    include HTTParty
    base_uri "https://api.github.com"

    def emojis
      self.class.get("/emojis",
                   headers: {"User-Agent" => "Mule-Deer-App"})
    end

    def gist(description, content, filename="file1.txt")
      options = {
        description: description,
        public: true,
        files: {
          filename => {
            content: content
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
