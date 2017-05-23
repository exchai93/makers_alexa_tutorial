require 'json'

module Alexa
  class Response < Hash

    def initialize(response_text)
      self[:version] = "1.0"
      self[:response] = Hash.new
      self[:response][:outputSpeech] = Hash.new
      self[:response][:outputSpeech][:type] = "PlainText"
      self[:response][:outputSpeech][:text] = response_text
    end

    def self.build(response_text = "Hello World")
      new(response_text).to_json
    end
  end
end

#
# post '/' do
#   parsed_request = JSON.parse(request.body.read)
#   number = parsed_request["request"]["intent"]["slots"]["Number"]["value"]
#   fact_type = parsed_request["request"]["intent"]["slots"]["FactType"]["value"]
#
#   number_facts_uri = URI("http://numbersapi.com/#{ number }/#{ fact_type }")
#   number_fact = Net::HTTP.get(number_facts_uri)
#
#   {
#     version: "1.0",
#     response: {
#       outputSpeech: {
#           type: "PlainText",
#           text: number_fact
#         }
#     }
#   }.to_json
# end
