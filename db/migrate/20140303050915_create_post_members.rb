class CreatePostMembers < ActiveRecord::Migration
  def change
    create_table :post_members do |t|
        t.references :user
        t.references :post

        t.timestamps
    end
  end
end