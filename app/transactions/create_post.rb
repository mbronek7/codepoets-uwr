# frozen_string_literal: true

class CreatePost
  include Dry::Transaction

  step :validate
  step :persist

  def validate(input)
    validation = PostValidator::NewPostSchema.call(input)
    if validation.success?
      Success(input)
    else
      Failure(validation.errors)
    end
  end

  def persist(input)
    post = create_post(input)
    SendNotifications.call(post.id)
    Success(post)
  end

  private

  def create_post(input)
    post = Post.new
    post.update_attributes!(input)
    post
  end
end
