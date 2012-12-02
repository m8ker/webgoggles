require 'httparty'

class Api::FacebookController < ApplicationController
  def friends
    @profiles = []
    if session['facebook_key']
      @profiles = HTTParty.get("#{SINGLY_API_BASE}/friends/facebook", :query => {:access_token => session['access_token']}).parsed_response
    end
    render :text => @profiles.to_json
  end

  def messages
  end

  def photos
  end
  
  def profile
    @profiles = []
    if session['facebook_key']
      @profiles = HTTParty.get("#{SINGLY_API_BASE}/profiles", :query => {:access_token => session['access_token']}).parsed_response
    end
    render :text => @profiles.to_json
  end
  
  SINGLY_API_BASE = "https://api.singly.com"
  
end