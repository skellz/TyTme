class CreateWishLists < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.integer :charity_id

      t.timestamps
    end
  end
end
