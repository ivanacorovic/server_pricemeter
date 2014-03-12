class Supermarket < ActiveRecord::Base

	has_many :price_meters
	has_many :products, through: :price_meters
	validates :product, presence: true
	validates :supermarket, presence: true
end
