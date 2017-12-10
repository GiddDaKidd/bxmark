class UserMailer < ApplicationMailer
  default from: "info@bxmark.net"

 def welcome_email(user)
   @user = user
   mail(to: @user.email, subject: 'Thanks for signing up')
 end
end
end
