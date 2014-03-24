require 'spec_helper'

feature 'Suggesting new product' do
	scenario 'when the search returns nothing' do
		visit root_path
		sign_in
		@products = FactoryGirl.create_list(:product, 10)
		click_link("Show Products")
		fill_in('search', with: "Tuta")
		click_on ('Search')
		expect(page).to have_css("#suggestion_name[value=\"Tuta\"]")
		
	end
end
