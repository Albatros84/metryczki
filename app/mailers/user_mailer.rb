class UserMailer < ActionMailer::Base
  default :from => "januszliro@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Registered")
  end
  
  def edited_profile(user)
    @user=user
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Profile edited")
  end
  
  def recover_password(user)
    @user=user
    mail(:to => "#{user.role} <#{user.email}>", :subject => "Your password")
  end
  
  def password_reset(user)
      @user = user
      mail :to => user.email, :subject => "Password Reset"
  end
  
  
end