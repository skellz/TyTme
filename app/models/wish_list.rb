class WishList < ActiveRecord::Base
  has_many :items, inverse_of: :wishlist
end
