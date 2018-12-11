# frozen_string_literal: true

module UserRelationship
  extend ActiveSupport::Concern

  def following?(other_user)
    following.include?(other_user)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end
end
