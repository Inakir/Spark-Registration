class UserMailer < ActionMailer::Base
  default :from => "admin@spark.com"

  def welcome_email(email,subject_text,text)
    @email = email
    mail(:to => email, :subject => subject_text,body: text)
  end
  
  def unpaid_email_groups(email,subject,text)
    @email = email
        mail(:to => email, :subject => subject_text, body: text)
  end
  
  def thanks_email(email)
    @email = email
    mail(:to => email, :subject => "SPARK Registration")
  end
end
