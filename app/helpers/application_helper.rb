module ApplicationHelper

	def get_prices(market, prices)
		prices.select { |p| p.supermarket_id == market.id }
	end

end
