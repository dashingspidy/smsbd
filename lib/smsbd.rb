# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require_relative "smsbd/version"

module Smsbd
  class Sms
    
    attr_accessor :base_url

    def initialize(api_key=nil)
      @api_key = ENV["SMS_API_KEY"]
      @base_url = 'https://api.sms.net.bd'
      @headers = { 'Content-Type': 'application/json'}
    end

    def send(msg, receiver)
      body = {"api_key": @api_key , "msg": msg, "to": receiver}
      puts body
      base_url = self.base_url + '/sendsms'
      response = Net::HTTP.post(URI(base_url), body.to_json, @headers)
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

    def balance
      uri = URI(self.base_url + '/user/balance')
      body = {"api_key": @api_key}
      uri.query = URI.encode_www_form(body)
      response = Net::HTTP.get_response(uri)
      JSON.parse(response.body)
    end

    def report(id)
      uri = URI(self.base_url + '/report/request/' + id.to_s)
      body = {"api_key": @api_key}
      uri.query = URI.encode_www_form(body)
      response = Net::HTTP.get_response(uri)
      JSON.parse(response.body)
    end
  end
end



