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
#  user_id     :bigint(8)
#  slug        :string
#

class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i(finders slugged)
  has_rich_text :content
  belongs_to :user


  def slug_candidates
    [
      :title,
      %i(title id)
    ]
  end
end
