class ChangeUsersFields < ActiveRecord::Migration
  def up
    rename_column :users, :description, :bio

    add_column :users, :display_name, :string

    remove_column :users, :skills
    remove_column :users, :photo
  end

  def down
    rename_column :users, :bio, :description

    remove_column :users, :display_name

    add_column :users, :skills, :text
    add_column :users, :photo, :string
  end
end
