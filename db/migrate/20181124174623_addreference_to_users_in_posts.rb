# frozen_string_literal: true

class AddreferenceToUsersInPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :author, foreign_key: { to_table: :users }
  end
end
