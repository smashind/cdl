class UserMailer < ApplicationMailer
	layout 'mailer'
  default from: "CDL Study Guide HQ <support@cdlstudyguidehq.com>"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to CDL Study Guide HQ!')
  end
end
