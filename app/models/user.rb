# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  biography       :text
#  website_url     :string
#  birthdate       :date
#  proffesion      :string
#

class User < ApplicationRecord
  has_secure_password
  has_many :posts, foreign_key: :author_id, class_name: "Post", dependent: :destroy
  has_many :active_followers, class_name:  "Relationship",
                              foreign_key: "follower_id",
                              dependent:   :destroy
  has_many :passive_following, class_name:  "Relationship",
                               foreign_key: "followed_id",
                               dependent:   :destroy
  has_many :following, through: :active_followers, source: :followed
  has_many :followers, through: :passive_following, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end
end
