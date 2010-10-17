require 'rubygems'
require 'json'
require 'httparty'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# module RockyKlout
#   VERSION = '0.0.1'
# end

class RockyKlout
    include HTTParty
    VERSION = '0.0.1'
  
    @@base_uri = "http://api.klout.com"
    @@api_version = "1"
  
    @@api_key = ""
    
    def initialize(api_key)
      @@api_key = api_key
    end

    def api_key=(api)
      @@api_key = api
    end
  
    def api_key
      @@api_key
    end

    def score(usernames)
      request_uri = "/#{@@api_version}/klout.json?key=#{@@api_key}&users=" + usernames.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def users(usernames)
      request_uri = "/#{@@api_version}/users/show.json?key=#{@@api_key}&users=" + usernames.join(",")
      self.class.get(@@base_uri + request_uri)
    end  
    
    def influenced_by(usernames)
      request_uri = "/#{@@api_version}/soi/influenced_by.json?key=#{@@api_key}&users=" + usernames.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def influcencer_of(usernames)
      request_uri = "/#{@@api_version}/soi/influencer_of.json?key=#{@@api_key}&users=" + usernames.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def topic_search(topic)
      request_uri = "/#{@@api_version}/topics/search.json?key=#{@@api_key}&users=" + CGI.escape(topic)
      self.class.get(@@base_uri + request_uri)
    end
    
    def topic_verfiy(topic)
      request_uri = "/#{@@api_version}/topics/verify.json?key=#{@@api_key}&users=" + CGI.escape(topic)
      self.class.get(@@base_uri + request_uri)
    end
    
end