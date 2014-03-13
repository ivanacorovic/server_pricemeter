require 'spec_helper'

	feature 'Displaying products that are on discount' do
		scenario 'When user selects certain supermarket' do

			@supermarkets = FactoryGirl.create_list(:supermarket, 3)
			@products = FactoryGirl.create_list(:product, 20)
			@products.each do |product, n| 
				FactoryGirl.create(:pricemeasure, product: product, supermarket: @supermarkets.first)
			end
			visit root_path
			click_link('Discounts')
			expect(page).to have_css('h2', text: "Discounts!!!")
		end
	end
