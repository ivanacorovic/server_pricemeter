require 'spec_helper'

	feature 'Displaying individual products' do
		scenario 'When a user clicks DETAIL' do
			@products = FactoryGirl.create_list(:product, 10)
			visit products_path
			click_link("Details#{@products.first.id}")
			#expect(page).to have_css('h1', text: "Products")
			expect(page).to have_css('h2', text: "Prices for #{@products.first.name}")
		end
	end
