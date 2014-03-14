module ApplicationHelper

	def get_prices(market, prices)
		prices.select { |p| p.supermarket_id == market.id }
	end

	def get_products_on_sale(prices)
		prices.select { |p| p.discount == true && p.measured_at > 2.week.ago}
	end 

	def get_price_measures(supermarket)
			@products = supermarket.products
	end

end
