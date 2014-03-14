require 'spec_helper'

	feature 'Displaying individual products' do
		scenario 'When a user clicks DETAIL' do
			@product = FactoryGirl.create(:product)
			@supermarket = FactoryGirl.create(:supermarket)
			@pricemeasure =FactoryGirl.create(:pricemeasure, product: @product, supermarket: @supermarket)
			visit products_path
			click_link("Details#{@product.id}")
			expect(page).to have_css('.product', count: 1)
		end
	end
