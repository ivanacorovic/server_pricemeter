require 'spec_helper'

	feature 'Displaying products' do
		scenario 'named simular to what you put in a search field' do
			@products = FactoryGirl.create_list(:product, 10)
			visit products_path
			fill_in('search', with: @products.first.name)
			click_on ('Search')
			expect(page).to have_css('td', text: @products.first.name)
			expect(page).to have_css('tr', count: 2)
		end
	end
