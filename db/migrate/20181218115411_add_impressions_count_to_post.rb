class AddImpressionsCountToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :impressions_count, :int
  end
end
