class AddCharityPhotoToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :charity_photo, :string
  end
end
