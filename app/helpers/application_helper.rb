module ApplicationHelper

	def get_prices(market, prices)
		prices.select { |p| p.supermarket_id == market.id }
	end

	def get_products_on_sale(prices)
		if prices
			prices.select { |p| p.discount == true && p.measured_at > 2.week.ago}
		end
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
		@prices = Pricemeasure.where("supermarket_id= ? and product_id IN (?)",
			 market.id,  products)
	end

	def selected_products(selected_products, all_products, user, list, listitems)
    listitems.select{|c| c.user_id == user.id && c.list_id == list.id} 
    listitems.each do |c|
    	selected_products << listitems.product_id
    end
    selected_products.each do |sp|
  	  products.select{|p| p.id == sp}
  	end
  end

end
