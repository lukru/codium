class AddRssToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rss, :string
  end
end
