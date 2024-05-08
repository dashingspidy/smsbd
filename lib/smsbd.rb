# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require_relative "smsbd/version"

module Smsbd
  BASE_URI = 'https://api.sms.net.bd/sendsms'
  API_KEY = 'AmpgC1Fh4VC9TuiboV8Czu0vD6bxffMuy13bNr'
  HEADERS = { 'Content-Type': 'application/json'}

  class Sms
    def send(msg, receiver)
      body = {"api_key": API_KEY, "msg": msg, "to": receiver}
      response = Net::HTTP.post(URI(BASE_URI), body.to_json, HEADERS)
      parsed = JSON.parse(response.body)
      case parsed["error"]
      when 0
        "Success."
      when 405
        "Authorization required."
      else
        "Error: #{parsed["error"]}:#{parsed["msg"]}"
      end        
    end
  end
end



