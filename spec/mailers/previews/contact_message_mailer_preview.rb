# Preview all emails at http://localhost:3000/rails/mailers/contact_message_mailer
class ContactMessageMailerPreview < ActionMailer::Preview
  def contact_us
    ContactMessageMailer.contact_us(ContactMessage.create(name: "John", email: "john@example.com", message: "Hi"))
  end
end
