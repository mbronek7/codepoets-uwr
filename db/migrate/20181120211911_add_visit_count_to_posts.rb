# frozen_string_literal: true

class AddVisitCountToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :visit_count, :integer, default: 0
  end
end
