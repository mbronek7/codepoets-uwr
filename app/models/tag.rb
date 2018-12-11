# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id   :bigint(8)        not null, primary key
#  name :string
#


class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings
end
