class RemoveTitleFromComments < ActiveRecord::Migration
  def change
  	remove_column :comments, :title
  	remove_column :comments, :image
  end
end
