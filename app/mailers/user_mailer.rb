class UserMailer < ApplicationMailer
  default from: "jensbikes@test.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'jvarelalijo@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
