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
#  slug            :string
#

class User < ApplicationRecord
  include ::UserRelationship
  extend FriendlyId

  has_secure_password
  has_one_attached :avatar
  friendly_id :slug_candidates, use: %i(finders slugged)
  has_many :posts, foreign_key: :author_id, class_name: "Post", dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_following, class_name: "Relationship",
                               foreign_key: "followed_id",
                               dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_following, source: :follower

  def slug_candidates
    [
      :name,
      %i(name id)
    ]
  end
end
