class UserMailer < ApplicationMailer
  default from: "info@bxmark.net"

 def welcome_email(user)
   @user = user
   mail(to: @user.email, subject: 'Thanks for signing up')
 end

 def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )
  end
end
