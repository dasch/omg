require "bundler/setup"
require "sinatra"

require_relative "pubsub"

use PubSub

get '/' do
  File.read(File.join("index.html"))
end
