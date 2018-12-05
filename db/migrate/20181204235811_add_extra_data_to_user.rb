class AddExtraDataToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website_url, :string
    add_column :users, :birthdate, :date
    add_column :users, :proffesion, :string
  end
end
