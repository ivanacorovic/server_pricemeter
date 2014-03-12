require 'spec_helper'

	feature 'Displaying products' do
		scenario 'When a user clicks SHOW PRODUCTS' do
			FactoryGirl.create_list(:product, 10)
			visit root_path
			click_link ('Show Products')
			#expect(page).to have_css('h1', text: "Products")
			expect(page).to have_css('tr', :count=> 11)
		end
	end
