require 'yaml'
require 'oauth'
require 'rubytter'
require 'tweet'

class TwitterClient

  def initialize()
    config_path = File.join(File.expand_path(File.dirname(__FILE__)),'..', 'config')
    config = YAML.load_file(File.join(config_path, 'config.yml'))
    
    access_token = get_access_token(config)
    @client = OAuthRubytter.new(access_token)
    @user_name = config[:twitter][:user_name]
    @list_name = config[:twitter][:list_name]
  end
   
  def get_list_timeline
    timeline = []
    @client.list_statuses(@user_name, @list_name).each do |status|
      timeline << parse_status(status)
    end
    timeline
  end
  
  def parse_status(status)
    tweet = Tweet.new
    tweet.profile_image = status.user[:profile_image_url]
    tweet.screen_name = status.user[:screen_name]
    tweet.geo = status.geo
    tweet.location = status.user[:location]
    tweet.text = status.text
    tweet.get_lat_long
    tweet
  end
  
  private
  
  def get_access_token(config)
    consumer = OAuth::Consumer.new(config[:twitter][:consumer_key], 
                  config[:twitter][:consumer_secret],
                  { :site => "http://api.twitter.com",
                    :scheme => :header})
    
    # now create the access token object from passed values
    token_hash = { :oauth_token => config[:twitter][:oauth_token],
                   :oauth_token_secret => config[:twitter][:oauth_token_secret]
                 }
                 
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    
    return access_token
  end
end
