class DeleteVisitsCountFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :visit_count
  end
end
