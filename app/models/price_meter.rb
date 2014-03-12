class PriceMeter < ActiveRecord::Base

	belongs_to :products
	belongs_to :supermarkets

end
