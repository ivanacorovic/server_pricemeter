module ApplicationHelper

	def get_prices(market, prices)
		prices.select { |p| p.supermarket_id == market.id }
	end

	def get_price_measures(supermarket)
		@products = supermarket.products
	end

	def already_in_the_list(product, list, user)
		@listitems= Listitem.all
		if @listitems
			@listitems.select {|c| c.product_id == product.id && c.list_id == list.id &&
				c.user_id == user.id}
		end	
	end

	def prices_from_the_list(market, products)
		@prices = Pricemeasure.descending.where("supermarket_id= ? and product_id IN (?)",
			market.id,  products).limit(1)
	end

end
