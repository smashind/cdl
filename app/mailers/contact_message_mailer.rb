class ContactMessageMailer < ActionMailer::Base
  layout 'mail'
  default from: "CDLBot <cdlbot@cdlstudyguidehq.com>"

  def contact_us(contact_message)
    @contact_message = contact_message
    @name = contact_message.name
    @email = contact_message.email
    @message = contact_message.message
    mail(to: 'tayhanning@gmail.com', subject: 'CDLHQ contact form')
  end
end