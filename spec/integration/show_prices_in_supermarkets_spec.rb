require 'spec_helper'

	feature 'Displaying products\' prices in supermarkets'  do
		scenario 'Prices' do
			@supermarkets = FactoryGirl.create_list(:supermarket, 3)
			@products = FactoryGirl.create_list(:product, 5)
			visit product_path(@products.first.id)
			#expect(page).to have_css('h1', text: "Products")
			expect(page).to have_css('td', "#{@supermarkets.first.name}")
		end
	end
