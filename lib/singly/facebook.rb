module Singly

  class Facebook
    
    def self.me(token, opts = {})
      query = {:query => {:access_token => token}.merge(opts)}
      return quick_call("profiles/facebook", query, token)
    end
    
    def self.friends(token, opts = {})
      query = {:query => {:sort => "photos", :access_token => token}.merge(opts)}
      return quick_call("friends/facebook", query, token)
    end
    
    def self.contacts(token, opts = {})
      query = {:query => {:sort => "photos", :access_token => token}.merge(opts)}
      return quick_call("types/contacts", query, token)
    end
    
    def self.photos_feed(token, opts = {})
      query = {:query => {:access_token => token}.merge(opts)}
      return quick_call("types/photos_feed", query, token)
    end
    
    def self.all_feed(token, opts = {})
      query = {:query => {:access_token => token}.merge(opts)}
      return quick_call("types/all_feed", query, token)
    end
    
    def self.quick_call(path, opts, token)
      puts "TOKEN: [#{token.inspect}]"
      if token
        return call_api(path, opts)
      end
      return nil
    end
    
    def self.call_api(path, opts)
      return HTTParty.get("#{Singly::API_BASE}/#{path}", opts).parsed_response
    end
    
  end
  
end
