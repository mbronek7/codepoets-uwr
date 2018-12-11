# frozen_string_literal: true

class SendNotifications < ApplicationService
  attr_accessor :post, :author

  def initialize(post_id)
    @post = Post.friendly.find(post_id)
    @author = @post.author
  end

  def call
    @author.followers.each do |user|
      mail = NotificationMailer.new_post_notification_email(user.id, @author.id, @post.id)
      mail.deliver_later
    end
  end
end
