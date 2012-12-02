require 'httparty'

class Api::FacebookController < ApplicationController
  def friends
    friends = []
    if session['access_token']
      friends = HTTParty.get("#{SINGLY_API_BASE}/friends/facebook", :query => {:sort => "photos" , :access_token => session['access_token']}).parsed_response
    end
    render :text => friends.to_json
  end

  def all_friends
    friends = []
    if session['access_token']
      count = HTTParty.get("#{SINGLY_API_BASE}/friends", :query => {:access_token => session['access_token']}).parsed_response
      puts [count["facebook"].inspect, "friends"].join(" ")
      i = 0
      
      (count["facebook"].to_i/20).times do |i|
        friends += HTTParty.get("#{SINGLY_API_BASE}/friends/facebook", :query => {:access_token => session['access_token'], :offset => i * 20}).parsed_response 
      end
    end
    puts "FRIEND COUNT: #{friends.length}"
    render :text => friends.to_json
  end

  def messages
  end

  def photos
          photos = []
          if session['access_token']
                  photos = HTTParty.get("#{SINGLY_API_BASE}/types/photos_feed", :query => {:access_token => session['access_token']}).parsed_response
          end
          render :text => photos.to_json
  end

  def feed
          updates = []
          if session['access_token']
                  updates = HTTParty.get("#{SINGLY_API_BASE}/types/all_feed", :query => {:access_token => session['access_token']}).parsed_response
          end
          render :text => updates.to_json
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
