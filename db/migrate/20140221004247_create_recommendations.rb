class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|

    	t.string :kind
    	t.references :user
    	t.references :post

      t.timestamps
    end
  end
end
