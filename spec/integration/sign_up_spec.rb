require 'spec_helper'

feature 'Sign up a new user' do 
	scenario 'with user email and password' do	
 	  sign_up
  	expect(page).to have_css('.alert-notice', text: "Welcome! You have signed up successfully.")
	end
end