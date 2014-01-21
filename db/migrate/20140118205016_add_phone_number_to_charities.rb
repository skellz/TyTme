class AddPhoneNumberToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :phone_number, :string
    add_column :charities, :fax_number, :string
  end
end
