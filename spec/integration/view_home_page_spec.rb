require 'spec_helper'

feature 'View the home page' do
  scenario 'user sees information' do
  	sign_in
  	expect(page).to have_css 'h1', text: 'Pricemeter'
  end
end

