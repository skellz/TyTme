class CreateCharitiesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :charities_users, id: false do |t|
      t.integer :charity_id
      t.integer :user_id
    end
  end
end