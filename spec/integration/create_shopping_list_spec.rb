require 'spec_helper'
feature 'Create shopping list' do
	scenario 'when user selects products' do

		@supermarkets = FactoryGirl.create_list(:supermarket, 3)
		@products = FactoryGirl.create_list(:product, 20)
		@lists = FactoryGirl.create_list(:list, 5)
		@user = FactoryGirl.create(:user)
		@supermarkets.each do |market| 
      @products.each do |product| 
        FactoryGirl.create(:pricemeasure, product: product, supermarket: market)
      end
    end
		visit root_path
		sign_in
		click_link("Create your shopping list!")
		click_on("Submit#{@products.first.id}")
		expect(page).to have_css('#item', count: 1)
		click_on("Remove#{@products.first.id}")
		expect(page).to have_css('#item', count: 0)
	end
end
