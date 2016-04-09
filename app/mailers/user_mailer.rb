class UserMailer < ActionMailer::Base
  default :from => "admin@spark.com"

  def welcome_email(email)
    @email = email
    mail(:to => email, :subject => "Please make your payment.")
  end
  
  def unpaid_email_groups(email)
    @email = email
        mail(:to => email, :subject => "Please make your payment1.", :body 'something')
  end
end
