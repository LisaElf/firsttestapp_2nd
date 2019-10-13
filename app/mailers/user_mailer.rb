class UserMailer < ApplicationMailer
  default from: "lisastestbikeshop@example.com"

  def contact_form(email, name, message)
    @message = message
    @name = name
    mail(from: email,
          to: 'lisa11@posteo.de',
          subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Lisas Test Bike Shop"
    mail(to: user.email,
          subject: "Welcome to #{@appname}!")
  end
end
