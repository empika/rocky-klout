require 'rubygems'
require 'json'
require 'httparty'
begin
  require 'cgi'
end

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

    def score_klout(usernames)
      request_uri = "/#{@@api_version}/klout.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def user_show(usernames)
      request_uri = "/#{@@api_version}/users/show.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",")
      self.class.get(@@base_uri + request_uri)
    end  
    
    def user_topics(usernames)
      request_uri = "/#{@@api_version}/users/topics.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def user_stats(usernames)
      request_uri = "/#{@@api_version}/users/stats.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def user_history(usernames, measure, start_date, end_date)
      request_uri = "/#{@@api_version}/users/show.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",") +
        "&measure=" + CGI.escape(measure) +
        "&start_date=" + CGI.escape(start_date)
        "&end_date=" + CGI.escape(end_date)
      self.class.get(@@base_uri + request_uri)
    end
    
    def relationship_influenced_by(usernames)
      request_uri = "/#{@@api_version}/soi/influenced_by.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def relationship_influcencer_of(usernames)
      request_uri = "/#{@@api_version}/soi/influencer_of.json?key=#{@@api_key}&users=" + usernames.collect{|name| CGI.escape(name)}.join(",")
      self.class.get(@@base_uri + request_uri)
    end
    
    def topic_search(topic)
      request_uri = "/#{@@api_version}/topics/search.json?key=#{@@api_key}&topic=" + CGI.escape(topic)
      self.class.get(@@base_uri + request_uri)
    end
    
    def topic_verify(topic)
      request_uri = "/#{@@api_version}/topics/verify.json?key=#{@@api_key}&topic=" + CGI.escape(topic)
      self.class.get(@@base_uri + request_uri)
    end
    
end