require 'pony'

def email_options()
 	{
    :address => 'smtp.gmail.com',
    :port => '587',
    :enable_starttls_auto => true,
    :user_name =>ENV['from'],
    :password => ENV["password"],
    :authentication => :plain, 
    :domain => ENV['domain']
    }
end

def send_email(title, details)
	begin
puts "email"
		Pony.mail(
		  :to => details[:email],
		  :cc => "joseph.p.mckenzie84@gmail.com",
		  :from => ENV["from"],
		  :subject => "Hello from Joseph Mckenzie", 
		  :content_type => 'text/html', 
		  :body => erb(:email,:layout=>false, locals: {details: details, title: title}),
		  :via => :smtp, 
		  :via_options => email_options()
		)
	rescue  => error
		puts "Error sending email #{error}"
	end
	puts "sent email??"
end
