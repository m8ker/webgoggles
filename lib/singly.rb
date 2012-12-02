module Singly
  require 'httparty'
  
  API_BASE = "https://api.singly.com"
  
  CLIENT_ID = "28d73ba2e4eac68eff50c8856d9e2c8f".freeze
  CLIENT_KEY = "58bdf3fb1b31eb93886b476da2535e3b".freeze
  
  def self.auth_callback
    val = if( Rails.env == "production" )
      "http://webgoggl.es/auth"
    else
      "http://localhost:3000/auth"
    end
    return URI.escape( val, "/:" )
  end
  
end

require './lib/singly/facebook'
