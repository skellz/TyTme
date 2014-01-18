class Charity < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :users
  has_one :wishlist
  has_many :items, through: :wishlist
  
  validates_uniqueness_of :email
  validates_presence_of :city
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :country
  validates_presence_of :state
  validates_presence_of :zip_code
  validates_presence_of :address
end
