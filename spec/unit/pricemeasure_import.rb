require 'spec_helper'

feature 'Upload a file' do
	scenario 'when user wants to import prices' do
		@supermarkets=FactoryGirl.create_list(:supermarket, 3)

		visit new_pricemeasure_import_path
		attach_file('file', Rails.root+'spec/fixtures/files/example.xls')
		select "#{@supermarkets.first.name}", :from => 'supermarket_id'
		click_button("Import")
		
		expect(page).to have_field("records[][bar_code]", with: "1234567892")
		expect(page).to have_field("records[][price]", with: "45.0")
		expect(page).to have_field("records[][discount]", with: "true")
		expect(page).to have_field("records[][measured_at]", with: "2014-03-26T07:56:39+00:00")
		expect(page).to have_css(".record", count: 4)
		

	end
end