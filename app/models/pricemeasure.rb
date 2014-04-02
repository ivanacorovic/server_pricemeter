class Pricemeasure < ActiveRecord::Base

	before_save :remove_prev_discount

	belongs_to :product 
	belongs_to :supermarket

	validates :product, presence:  { message: "No product with that bar_code"}
	validates :supermarket, presence: true
	validates :price, presence: true
	validates :discount, presence:  true 
	#validates :bar_code, format: { with: /\A([0-9]{8}|[0-9]{13})\Z/, message: "%{value} must be 13 or 8 digits for bar_code"}
	scope :descending, -> {order('measured_at DESC')}

	scope :by_market,->(market) {where(supermarket_id: market.id)}

	scope :latest_prices, lambda {
		 
		joins(%Q{
			LEFT OUTER JOIN pricemeasures ls ON
			(
				pricemeasures.measured_at < ls.measured_at AND
				pricemeasures.product_id = ls.product_id AND
				pricemeasures.supermarket_id = ls.supermarket_id
			)
		}).where("ls.id IS NULL")
	}

	attr_accessor :bar_code
	
	def self.total(prices)
		@total=prices.sum('price')
	end



	def self.prices_from_the_list(products)

		where("pricemeasures.product_id IN (?)", products)
		#where(product_id: product)
	end

	def self.products_on_sale
		where(discount: true)
	end

	private
	
	def remove_prev_discount
		if self.discount == true
			prices = Pricemeasure.where(product_id: self.product_id, 
			 supermarket_id: self.supermarket_id, discount: true)
			prices.each do |price|
				if price.measured_at <= self.measured_at
					price.update(discount: false)
				end
			end
		end
	end

	def self.price_for(product, date)
		where(product_id: product, measured_at: date.beginning_of_day..date.end_of_day).average(:price) || 0
	end
	
	def self.last_month_average(product)
		where(product_id: product, measured_at: (Date.today-1.months).at_beginning_of_month..(Date.today-1.months).end_of_month).average(:price) || 0
	end

	def self.last_month_max(product)
		where(product_id: product, measured_at: (Date.today-1.months).at_beginning_of_month..(Date.today-1.months).end_of_month).maximum(:price) || 0
	end

	def self.last_month_min(product)
		where(product_id: product, measured_at: (Date.today-1.months).at_beginning_of_month..(Date.today-1.months).end_of_month).minimum(:price) || 0
	end

	def self.max_by_year(product, date)
		where(product_id: product, measured_at: (date).at_beginning_of_year..(date).end_of_year).maximum(:price) || 0
	end

end
