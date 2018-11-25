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
#

class User < ApplicationRecord
  has_secure_password
  has_many :posts, foreign_key: :author_id, class_name: 'Post', dependent: :destroy
end
