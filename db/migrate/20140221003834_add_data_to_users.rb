class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :given_name, :string
    add_column :users, :family_name, :string
    add_column :users, :photo, :string
    add_column :users, :description, :text
    add_column :users, :skills, :text
    add_column :users, :tagline, :string
  end
end
