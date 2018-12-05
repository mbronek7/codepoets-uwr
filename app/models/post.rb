# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  visit_count :integer          default(0)
#  author_id   :bigint(8)
#  slug        :string
#

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i(finders slugged)
  has_rich_text :content
  belongs_to :author, class_name: "User"
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def slug_candidates
    [
      :title,
      %i(title id)
    ]
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end
end
