class Pricemeasure < ActiveRecord::Base

	before_save :remove_prev_discount

	belongs_to :product
	belongs_to :supermarket

	validates :product, :presence => true
	validates :supermarket, :presence => true
	validates :price, presence: { message: "You have to input price!"}
	validates :discount, presence:  true 
	#validates :supermarket_id, presence: { message: "You forgot supermarket somewhere!"}
	scope :descending, -> {order('measured_at DESC')}

	scope :by_market,->(market) {where(supermarket_id: market.id)}

	attr_accessor :bar_code
	
	def self.total(prices)
		@total=prices.sum('price')
	end

	def self.get_products_on_sale(market)
		where(supermarket_id: market.id, discount: true, measured_at: 2.week.ago..DateTime.now)
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

	def self.price_for(product, date)
		where(product_id: product, measured_at: date.beginning_of_day..date.end_of_day).average(:price) || 0
	end
	

end
