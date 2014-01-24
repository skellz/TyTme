class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.integer :wish_list_id

      t.timestamps
    end
  end
end
