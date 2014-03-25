require 'spec_helper'

feature 'Sign in user' do 
	scenario 'with user email and password' do	
 	  sign_in
  	expect(page).to have_css('.logout', text: "Sign out")
  	click_link("Sign out")
  	expect(page).to have_css('.login', text: "Sign in")
	end
end
