require "picking_token/version"
require "json"


module PickingToken
  class Error < StandardError; end
  # Your code goes here...
  #
  def pick_tokens_recomendations(json_path)
    begin
      file = File.open(json_path)
      data = JSON.load(file)
      take_four_token = TakeFourToken(data)
      recommendations = take_four_token.take_recommendations
      puts(recommendations.to_s)
      recommendations
    rescue Exception => e
      puts "ERROR: #{e.message}"
    end
  end

  class JsonTokens
    def initialize(json_data)
      @json_data = json_data
    end

    def logs
      @json_data["logs"]
    end

    def content
      @json_data["content"]
    end

    def myad
      @json_data["myad"]
    end
  end

  class TakeFourToken
    def initialize(json_data)
      @json_data = JsonTokens(json_data)
      @recommendations_number=4
    end

    def take_recommendations
      recommendations = []
      logs = @json_data.logs
      content = @json_data.content
      myad = @json_data.myad
      while i< @recommendations_number
        unless logs.nil?
          recommendations.append(logs.pop)
        end
        unless content.nil?
          recommendations.append(content.pop)
        end
        unless myad.nil?
          recommendations.append(myad.pop)
        end
      end
      recommendations
    end
  end
end
