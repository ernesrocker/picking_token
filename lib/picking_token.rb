require "picking_token/version"
require "json"

RECOMMENDATION_NUMBER = 4

module PickingToken

  def self.pick_tokens_recommendations(json_path)
    begin
      file = File.open(json_path)
      data = JSON.load(file)
      take_controller= TokenController.new(data)
      recommendations = take_controller.take_recommendations
      recommendations
    rescue Exception => e
      puts "ERROR: #{e.message}"
      raise
    end
  end

  class JsonTokens
    def initialize(json_data)
      @json_data = json_data
    end

    def get_all_tokens
      tokens_matrix = []
      @json_data.each do |algorithm, v|
        tokens_matrix.append(get_tokens_by_algorithm(algorithm))
      end
      tokens_matrix
    end

    def get_tokens_by_algorithm(algorithm)
      articles = @json_data[algorithm]
      !articles.nil? ? get_tokens_list(articles) : nil
    end

    def get_tokens_list(articles_list)
      tokens = []
      unless articles_list.nil? || articles_list.empty?
        articles_list.each do |article|
          # Pick only 4 tokens
          if tokens.size() < RECOMMENDATION_NUMBER
            tokens.append(article["token"].to_i)
          end
        end
      end
      tokens
    end
  end

  class TokenController
    def initialize(json_data)
      json_data = JsonTokens.new(json_data)
      @tokens = json_data.get_all_tokens
    end

    def take_recommendations
      recommendations = []
      first_algoritm_tokens = @tokens[0]
      second_algoritm_tokens = @tokens[1]
      third_algoritm_tokens = @tokens[2]
      max_tokens = [first_algoritm_tokens.size(), second_algoritm_tokens.size(), third_algoritm_tokens.size()].max
      loop_number = max_tokens < RECOMMENDATION_NUMBER ? max_tokens : RECOMMENDATION_NUMBER
      loop_number.times do
        unless first_algoritm_tokens.nil? || first_algoritm_tokens.empty?
          recommendations.append(first_algoritm_tokens.shift)
        end
        unless second_algoritm_tokens.nil? || second_algoritm_tokens.empty?
          recommendations.append(second_algoritm_tokens.shift)
        end
        unless third_algoritm_tokens.nil? || third_algoritm_tokens.empty?
          recommendations.append(third_algoritm_tokens.shift)
        end
      end
      recommendations[0..3]
    end
  end
end
