# frozen_string_literal: true

# == Schema Information
#
# Table name: taggings
#
#  id         :bigint(8)        not null, primary key
#  post_id    :bigint(8)
#  tag_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Tagging < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end
