class UserMailer < ApplicationMailer

   default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/users/sign_in"
    WelcomeEmailJob.perform_later(@user)
  end
end
