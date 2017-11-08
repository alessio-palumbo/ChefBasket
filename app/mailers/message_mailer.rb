class MessageMailer < ApplicationMailer
  def message_notification(recipient, subject, message)
    @from_email = ENV.fetch('ORDER_EMAIL')
    @message = message
    @subject = subject
    mail(to: recipient, subject: subject)
  end
end
