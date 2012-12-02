require 'httparty'

class WelcomeController < ApplicationController
  def index
    @me = Singly::Facebook.me(session['access_token'])
    @friends = Singly::Facebook.friends(session['access_token'])
    ids = @friends.collect{|f| f["services"]["facebook"]["id"] }
    @photos = Singly::Facebook.photos_for(session['access_token'], ids)
    @statuses = Singly::Facebook.statuses_for(session['access_token'], ids)
  end
  
  def login
  end

  def logout
    reset_session
    redirect_to "/"
  end
  
  def auth
    data = HTTParty.post("https://api.singly.com/oauth/access_token", :body => {
      :client_id => SINGLY_CLIENT_ID,
      :client_secret => SINGLY_CLIENT_KEY,
      :code => params[:code]})
    data = data.parsed_response
    session[:account] = data["account"]
    session[:access_token] = data["access_token"]
    redirect_to "/"
  end
  
  SINGLY_API_BASE = "https://api.singly.com"
  
  SINGLY_CLIENT_ID = "28d73ba2e4eac68eff50c8856d9e2c8f".freeze
  SINGLY_CLIENT_KEY = "58bdf3fb1b31eb93886b476da2535e3b".freeze
end
