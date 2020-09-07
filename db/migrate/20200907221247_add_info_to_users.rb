class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :website_url, :string
    add_column :users, :short_url, :string
  end
end
