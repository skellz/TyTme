class Item < ActiveRecord::Base
  belongs_to :wishlist, inverse_of: :items
end
