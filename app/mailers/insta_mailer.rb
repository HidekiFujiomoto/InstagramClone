class InstaMailer < ApplicationMailer
  def send_email(user_email)
    @user_email = user_email

    mail to: user_email, subject: "【InstagramClone】新しく投稿しました"
  end
end
