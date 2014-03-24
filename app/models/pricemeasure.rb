class Pricemeasure < ActiveRecord::Base

	before_save :remove_prev_discount

	belongs_to :product
	belongs_to :supermarket
	validates :product, presence: true
	validates :supermarket, presence: true
	scope :descending, -> {order('measured_at DESC')}

	def self.total(prices)
		@total=prices.sum('price')
	end


	private
	
	def remove_prev_discount
		if self.discount == true
			prices=Pricemeasure.where(product_id: self.product_id, 
			 supermarket_id: self.supermarket_id, discount: true)
			if prices
					prices.update_all(discount: false)
			end
		end
	end

end
