require 'sinatra'
require_relative 'methods/email.rb'
load "./local_env.rb" if File.exists?("./local_env.rb")


get '/' do
puts "hi"
    erb :index
end

post '/contact' do
puts "yo"
    firstname = params[:firstname]
    lastname = params[:lastname]
    name = "#{firstname} #{lastname}"
    email = params[:email]
    phone = params[:phone]
    message = params[:message]

    send_email('Thank You For Contacting Me.', {name: name, phone: phone, email: email, message: message})
return "hi"

end
