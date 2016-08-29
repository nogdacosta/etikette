class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def new_record_notification(record)
    @record = record
    mail to: "USER@usermail.com", subject: "Success! You did it."
  end

end
