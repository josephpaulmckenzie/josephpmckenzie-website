require 'sinatra'
require_relative 'methods/email.rb'
load "./local_env.rb" if File.exists?("./local_env.rb")


get '/' do
puts "hi"
    return "hi"
end
