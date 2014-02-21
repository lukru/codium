class AddSubtitleAndBodyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :subtitle, :string
    add_column :posts, :body, :string
  end
end
