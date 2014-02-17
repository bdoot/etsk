require "sinatra" 
require "haml"
require "data_mapper"

DOMAIN = "http://doot.us/"

configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

configure :production do
  DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_RED_URL'])
end

def create_link(url, label=nil)
  label ||= url

  "<a href=\"#{url}\">#{label}</a>"
end

class Link
  include DataMapper::Resource

  property :label, String, key: true
  property :url,   String
end

DataMapper.auto_upgrade!

get "/" do
 haml :index
end

get "/:label" do
  @link = Link.get(params[:label])
  haml :redirect
end

post "/" do
  @link = Link.create(params)
  @label = "#{DOMAIN}#{@link[:label]}"

  haml :index
end

