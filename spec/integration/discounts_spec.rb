require 'spec_helper'

feature 'Displaying products that are on discount' do
	scenario 'When user selects certain supermarket' do

		@supermarket = FactoryGirl.create(:supermarket)
		@products = FactoryGirl.create_list(:product, 20)
		@products.each do |product| 
			FactoryGirl.create(:pricemeasure, product: product, supermarket: @supermarket)
		end
		visit discount_supermarket_path(@supermarket)
		#expect(Pricemeasure.where(discount: true).count).to eq(20)
		
		expect(page).to have_css('#discount', :between => 1..20)
	end
end
