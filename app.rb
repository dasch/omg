require "bundler/setup"
require "sinatra"

get '/' do
  File.read(File.join("elm", "index.html"))
end
