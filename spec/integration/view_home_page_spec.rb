require 'spec_helper'

feature 'View the home page' do
  scenario 'user sees home page' do
  	@supermarkets = FactoryGirl.create_list(:supermarket, 3)
		@products = FactoryGirl.create_list(:product, 20)
		@products.each do |product, n| 
			FactoryGirl.create(:pricemeasure, product: product, supermarket: @supermarkets.first)
		end
	  visit root_path
	  click_link(@supermarkets.first.name)
	  expect(page).to have_css('.list-group-item', count: 10)
	 end
end

