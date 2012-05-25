class UserMailer < ActionMailer::Base
	default :from => "nick.joosung.hwang@gmail.com"

	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered!", :host => "localhost:3000")
	end
end
