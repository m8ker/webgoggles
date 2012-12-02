require 'httparty'

class WelcomeController < ApplicationController
  def index
  end
  
  def login
  end
  
  def auth
    puts params.inspect
    data = HTTParty.post("https://api.singly.com/oauth/access_token", :body => {
      :client_id => SINGLY_CLIENT_ID,
      :client_secret => SINGLY_CLIENT_KEY,
      :code => params[:code]})
    puts data.inspect
    data = data.parsed_response
    puts data.inspect
    session[:account] = data["account"]
    session[:access_token] = data["access_token"]
    puts session.inspect
    redirect_to "/"
  end
  
  SINGLY_CLIENT_ID = "28d73ba2e4eac68eff50c8856d9e2c8f".freeze
  SINGLY_CLIENT_KEY = "58bdf3fb1b31eb93886b476da2535e3b".freeze
end
