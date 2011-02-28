$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), 'lib')

require 'rubygems'
require 'sinatra'
require 'sinatra/static_assets'
require 'twitter_client'

get '/' do
  twitter = TwitterClient.new
  @current_timeline = twitter.get_list_timeline

  @ip = request.env['REMOTE_ADDR']
  
  erb :index
end
