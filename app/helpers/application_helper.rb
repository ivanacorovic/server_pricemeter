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

	def already_in_the_list(product, list, user)
		@carts= Cart.all
		if @carts
			@carts.select {|c| c.product_id == product.id && c.list_id == list.id &&
				 c.user_id == user.id}
		end
		
	end

end
