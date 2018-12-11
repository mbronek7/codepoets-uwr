# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def new_post_notification_email(user_id, author_id, post_id)
    @user = User.friendly.find(user_id)
    @author = User.friendly.find(author_id)
    @post = Post.friendly.find(post_id)

    mail(to: @user.email,
         subject: "New post from #{@author.name}") do |format|
      format.text
      format.html
    end
  end
end
