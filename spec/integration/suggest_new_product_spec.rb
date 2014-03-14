require 'spec_helper'

	feature 'Suggesting new product' do
		scenario 'when the search returns nothing' do
			@products = FactoryGirl.create_list(:product, 10)
			visit products_path
			fill_in('search', with: "Tuta")
			click_on ('Search')
			expect(page).to have_css('.fail', text: "Sorry, we don't keep track of that product. Would you like us to?")
		end
	end
