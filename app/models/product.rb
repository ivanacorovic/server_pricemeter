class Product < ActiveRecord::Base
	
	has_many :price_meters
	has_many :supermarkets, through: :price_meters

end
