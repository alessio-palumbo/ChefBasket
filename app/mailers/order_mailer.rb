class OrderMailer < ApplicationMailer
  def order_notification(recipient, subject, message)
    @from_email = ENV.fetch('ORDER_EMAIL')
    @message = message
    mail(to: recipient, subject: subject)
  end
end
