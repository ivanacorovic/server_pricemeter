require 'spec_helper'

	feature 'Sing up a new user' do 
		scenario 'with user email and password' do	
	 	  sign_up
	 	  #expect(page).to have_css('h2', text: "Sign up")
	  	expect(page).to have_css('p', text: "Welcome! You have signed up successfully.")
	end
end